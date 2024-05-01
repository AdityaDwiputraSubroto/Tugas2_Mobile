import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_mobile2/controllers/account_controller.dart';
import 'package:tugas_mobile2/models/website_model.dart';
import 'package:tugas_mobile2/utils/colors.dart';
import 'package:tugas_mobile2/views/screens/favorite_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/websites_data.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<FavoriteScreen> {
  String? userID;
  List<String> userFavorites = [];
  bool loaded = false;
  List<Website>? favoriteWebsites;

  Future<void> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userID');
    });
  }

  Future<void> getUserFavorites() async {
    if (userID != null) {
      List<String> favorites =
          await AccountController.getUserFavorites(userID!);
      setState(() {
        userFavorites = favorites;
      });
      print("user favorites");
      print(userFavorites);
    }
  }

  Future<void> getFavoriteWebsites() async {
    List<Website> favoriteWebs = websites
        .where((website) => userFavorites.contains(website.id))
        .toList();
    setState(() {
      favoriteWebsites = favoriteWebs;
    });
    print("favorited website");
    print(favoriteWebsites);
  }

  Future<void> initializeUserFavorites() async {
    await getUserID();
    await getUserFavorites();
    await getFavoriteWebsites();
    loaded = true;
  }

  @override
  void initState() {
    super.initState();
    initializeUserFavorites();
  }

  @override
  Widget build(BuildContext context) {
    // Only build the Scaffold when user favorites are fetched
    if (loaded == false) {
      // Show loading indicator or placeholder if user favorites are empty
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (favoriteWebsites!.length != 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: favoriteWebsites?.length ?? 0,
            itemBuilder: (context, index) {
              final website = favoriteWebsites?[index];
              return WebsiteTile(
                website: website!,
                userID: userID,
                userFavorites: userFavorites,
                onFavoriteChanged: () {
                  getUserFavorites();
                },
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tidak ada Favorite",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      );
    }
  }
}

class WebsiteTile extends StatefulWidget {
  final Website website;
  final String? userID;
  final List<String> userFavorites;
  final VoidCallback onFavoriteChanged;

  WebsiteTile({
    required this.website,
    required this.userID,
    required this.userFavorites,
    required this.onFavoriteChanged,
  });

  @override
  _WebsiteTileState createState() => _WebsiteTileState();
}

class _WebsiteTileState extends State<WebsiteTile> {
  bool isFavorite = false;
  String rootDirImage = 'assets/images/';

  @override
  void initState() {
    super.initState();
    // Set isFavorite based on whether website ID is in userFavorites
    isFavorite = widget.userFavorites.contains(widget.website.id);
    print("${widget.website.id} $isFavorite");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          _launchURL(widget.website.urlWebsite);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "$rootDirImage${widget.website.image}",
                width: double.infinity,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.website.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      print("favorite : $isFavorite");
                      // Toggle favorite and update userFavorites
                      AccountController.toggleFavorite(
                          widget.userID, widget.website.id);
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      widget
                          .onFavoriteChanged(); // Notify parent widget of favorite change
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
    }
  }
}
