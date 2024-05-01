import 'package:flutter/material.dart';
import 'package:tugas_mobile2/controllers/auth_controller.dart';
import 'package:tugas_mobile2/utils/colors.dart';

class LogoutConfirmation extends StatelessWidget {
  const LogoutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: ColorsCalc.hexToColor(ColorsCalc.green),
        title: Text("Logout", style: TextStyle(color: Colors.white)),
        content: Text("Apakah Anda yakin ingin logout?",
            style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel",
                style:
                    TextStyle(color: ColorsCalc.hexToColor(ColorsCalc.orange))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsCalc.hexToColor(ColorsCalc.orange),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              AuthController().logout(context);
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]);
    ;
  }
}
