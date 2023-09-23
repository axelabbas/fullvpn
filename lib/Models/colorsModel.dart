import 'package:flutter/material.dart';

class appColors {
  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color greenAccent;
  late Color orangeAccent;
  appColors() {
    primaryColor = Color(0xFF1F6BEC);
    secondaryColor = Color(0xFFEBEBF5).withOpacity(0.6);
    tertiaryColor = Color(0xFFEBEBF5).withOpacity(0.3);
    greenAccent = Color(0xFF2CC57B);
    orangeAccent = Color(0xFFFFA51D);
  }
}

appColors myColors = appColors();
