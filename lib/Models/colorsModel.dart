import 'package:flutter/material.dart';

class appColors {
  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color greenAccent;
  late Color orangeAccent;
  late Color bgColor;
  appColors() {
    primaryColor = Color.fromRGBO(31, 107, 236, 1);
    secondaryColor = const Color(0xFFEBEBF5).withOpacity(0.6);
    tertiaryColor = const Color(0xFFEBEBF5).withOpacity(0.3);
    greenAccent = const Color(0xFF2CC57B);
    orangeAccent = const Color(0xFFFFA51D);
    bgColor = Colors.black;
  }
}

appColors myColors = appColors();
