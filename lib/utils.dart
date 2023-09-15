import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';

bool isDarkMode(BuildContext context, WidgetRef ref) =>
    ref.watch<ToggleDarkModeViewModel>(toggleDarkModeViewModel).isDarkMode;
