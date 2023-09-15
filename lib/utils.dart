import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';

bool isDarkMode(BuildContext context) =>
    context.watch<ToggleDarkModeViewModel>().isDarkMode;
