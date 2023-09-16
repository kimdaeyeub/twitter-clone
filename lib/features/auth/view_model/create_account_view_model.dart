import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/auth/repos/auth_repo.dart';
import 'package:twitter/features/common/main_navigation_screen.dart';
import 'package:twitter/utils.dart';

class CreateAccountViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> createAccount(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final createUser = await _authRepo.createAccount(email, password);
      print(ref.watch(authRepo).isLoggedIn);
    });

    if (state.hasError) {
      showFirebaseErrorSnack(
        context,
        state.error,
      );
    } else {
      context.go("/");
    }
  }
}

final createAccountVM = AsyncNotifierProvider<CreateAccountViewModel, void>(
  () => CreateAccountViewModel(),
);
