import 'package:flutter/material.dart';

class ColorsCalc {
  static const String green = '#045e46';
  static const String orange = '#fca901';
  static const String white = '#fdffff';

  static Color hexToColor(String hex) {
    // Remove '#' from the beginning of the hex code
    String hexColor = hex.replaceAll('#', '');

    // Convert hex color to integer
    int hexInt = int.parse(hexColor, radix: 16);

    // Create Color object from hex integer
    return Color(hexInt).withOpacity(1.0);
  }
}
