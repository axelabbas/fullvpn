import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:fullvpn/Models/colorsModel.dart';

class powerbuttonProvider with ChangeNotifier {
  Color bgColor = myColors.primaryColor;
  bool isOn = false;
  bool isLoading = false;
  double progress = 0.0;
  Color progressColor = myColors.primaryColor;
  bool isGlowing = false;

  int counter = 0;
  late CustomTimerController _timeController;

  counterReset() {
    _timeController.reset();
  }

  setTimeController(timeController) {
    _timeController = timeController;
  }

  counterStart() {
    _timeController.start();
  }

  update() async {
    isGlowing = true;

    while (isLoading) {
      await Future.delayed(const Duration(milliseconds: 1));

      progress += 0.001;
      if (progress >= 1) {
        progress = 1;

        isLoading = false;
      }

      notifyListeners();
    }
  }

  turnOn() {
    isLoading = false;
    isOn = true;
    counterStart();
    bgColor = myColors.greenAccent;
    progressColor = myColors.greenAccent;
    notifyListeners();
  }

  startLoading() async {
    isLoading = true;
    bgColor = Colors.black;

    await update();
    turnOn();

    notifyListeners();
  }

  turnOff() {
    counterReset();
    isOn = false;
    bgColor = myColors.primaryColor;
    progress = 0.0;
    progressColor = myColors.primaryColor;

    isGlowing = false;
    notifyListeners();
  }
}
