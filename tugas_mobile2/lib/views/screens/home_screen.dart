import 'package:flutter/material.dart';
import 'package:tugas_mobile2/utils/colors.dart';
import 'package:tugas_mobile2/views/screens/bilangan_prima.dart';
import 'package:tugas_mobile2/views/screens/data_kelompok_screen.dart';
import 'package:tugas_mobile2/views/screens/favorite_screen.dart';
import 'package:tugas_mobile2/views/screens/segitiga.dart';
import 'package:tugas_mobile2/views/screens/website_screen.dart';
import 'package:tugas_mobile2/views/widgets/logout_confirmation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showLogoutConfirmation(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LogoutConfirmation();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Halaman Utama',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                showLogoutConfirmation(context);
              },
            ),
          ],
          iconTheme:
              IconThemeData(color: ColorsCalc.hexToColor(ColorsCalc.orange)),
          backgroundColor: ColorsCalc.hexToColor(
              ColorsCalc.green) // Replace with your desired color
          ),
      body: Center(
        // Center widget di sini
        child: ListView(
          padding: EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: [
            MenuItemCard(
              title: 'Daftar Anggota',
              icon: Icons.people,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataKelompokScreen()),
                );
              },
            ),
            MenuItemCard(
              title: 'Bilangan Prima',
              icon: Icons.check_circle_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BilanganPrima()),
                );
              },
            ),
            MenuItemCard(
              title: 'Luas dan Keliling Segitiga',
              icon: Icons.change_history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Segitiga()),
                );
              },
            ),
            MenuItemCard(
              title: 'Situs Rekomendasi',
              icon: Icons.link,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WebsiteScreen()),
                );
              },
            ),
            MenuItemCard(
              title: 'Favorite',
              icon: Icons.favorite,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItemCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color:
          ColorsCalc.hexToColor(ColorsCalc.green), // Ubah warna background card
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon,
                  size: 36.0,
                  color: Color.fromRGBO(
                      183, 192, 14, 1)), // Ubah warna ikon menjadi putih
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ColorsCalc.hexToColor(
                          ColorsCalc.white)), // Ubah warna teks menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
