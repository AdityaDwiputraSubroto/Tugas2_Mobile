// controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_mobile2/data/account_data.dart';
import 'package:tugas_mobile2/models/account_model.dart';
import 'package:tugas_mobile2/models/auth_model.dart';
import 'package:tugas_mobile2/views/screens/bottomNavBar.dart';
import 'package:tugas_mobile2/views/screens/home_screen.dart';
import 'package:tugas_mobile2/views/screens/login_screen.dart';

class AuthController {
  Future<void> login(
      BuildContext context, String username, String password) async {
    // Check if the entered username and password match any account

    try {
      Account? account = await AuthModel().login(username, password);
      if (account != null) {
        // Save the account ID in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userID', account.id);
        await prefs.setString('username', account.username);
        print('success');
        print(prefs.getString(('userID')));
        // Navigate to the next screen after successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return BottomNavBar();
          }),
        );
      } else {
        // Show Snackbar indicating login failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Login failed. Please check your username and password.'),
          ),
        );
      }
    } catch (error) {
      print('Error during login: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during login.'),
        ),
      );
    }
  }

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logout Success'),
      ),
    );
  }
}
