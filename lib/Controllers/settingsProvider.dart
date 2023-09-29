import 'package:flutter/material.dart';

class settingsProvider with ChangeNotifier {
  bool autoStart = false;
  bool killSwitch = false;

  toggleKillswitch() {
    killSwitch = !killSwitch;
    notifyListeners();
  }

  toggleAutoStart() {
    autoStart = !autoStart;
    notifyListeners();
  }
}
