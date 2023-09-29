import 'package:flutter/material.dart';

class profileProvider with ChangeNotifier {
  bool isLogged = false;
  login() {
    isLogged = true;
    notifyListeners();
  }

  logout() {
    isLogged = false;
    notifyListeners();
  }
}
