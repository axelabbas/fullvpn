import 'package:flutter/material.dart';

class appColors {
  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color greenAccent;
  late Color orangeAccent;
  appColors() {
    primaryColor = const Color(0xFF1F6BEC);
    secondaryColor = const Color(0xFFEBEBF5).withOpacity(0.6);
    tertiaryColor = const Color(0xFFEBEBF5).withOpacity(0.3);
    greenAccent = const Color(0xFF2CC57B);
    orangeAccent = const Color(0xFFFFA51D);
  }
}

appColors myColors = appColors();
