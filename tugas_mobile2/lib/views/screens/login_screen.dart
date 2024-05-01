import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_mobile2/controllers/auth_controller.dart';
import 'package:tugas_mobile2/data/account_data.dart';
import 'package:tugas_mobile2/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            _usernameField(),
            _passwordField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: _usernameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Validation passed, perform login logic here
              print('Username: ${_usernameController.text}');
              print('Password: ${_passwordController.text}');

              String username = _usernameController.text;
              String password = _passwordController.text;

              AuthController().login(context, username, password);
            }
          },
          child: Text(
            'LOGIN',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsCalc.hexToColor(ColorsCalc.orange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
