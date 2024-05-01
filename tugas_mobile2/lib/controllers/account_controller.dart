import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_mobile2/data/account_data.dart';
import 'package:tugas_mobile2/models/account_model.dart';

class AccountController {
  static void toggleFavorite(String? userId, String websiteId) {
    final index = accounts.indexWhere((account) => account.id == userId);
    if (index != -1) {
      Account userAccount = accounts[index];
      if (userAccount.favorites.contains(websiteId)) {
        userAccount.removeFavorite(websiteId);
      } else {
        userAccount.addFavorite(websiteId);
      }
      accounts[index] = userAccount;
      print("favorited");
    }
  }

  static List<String> getUserFavorites(String userId) {
    Account? userAccount = accounts.firstWhere(
      (account) => account.id == userId,
    );

    if (userAccount != null) {
      return userAccount.favorites;
    } else {
      // Return an empty list if the user account is not found
      return [];
    }
  }

  // static Future<String?> getUserID() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userID = prefs.getString('userID');
  //   return userID;
  // }
}
