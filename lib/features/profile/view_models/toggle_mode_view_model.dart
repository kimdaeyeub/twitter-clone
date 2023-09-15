import 'package:flutter/material.dart';

class ToggleDarkModeViewModel extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

// final toggleDarkModeViewModel=Toggle