import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/profile/view_models/toggle_mode_view_model.dart';

bool isDarkMode(BuildContext context, WidgetRef ref) =>
    ref.watch<ToggleDarkModeViewModel>(toggleDarkModeViewModel).isDarkMode;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        (error as FirebaseException).message ?? "회원정보를 확인해주시기 바랍니다.",
      ),
    ),
  );
}
