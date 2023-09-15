import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/profile/models/dark_mode_model.dart';
import 'package:twitter/features/profile/repos/settings_screen_repository.dart';

class ToggleDarkModeViewModel extends ChangeNotifier {
  late DarkModeModel _model = DarkModeModel(darkMode: false);

  bool get isDarkMode => _model.darkMode;

  void toggleDarkMode() {
    final currentMode = _model.darkMode;
    _model = DarkModeModel(darkMode: !currentMode);
    notifyListeners();
  }
}

final toggleDarkModeViewModel = ChangeNotifierProvider((ref) {
  return ToggleDarkModeViewModel();
});
