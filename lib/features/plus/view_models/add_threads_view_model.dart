import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/auth/repos/auth_repo.dart';
import 'package:twitter/features/plus/models/threads_model.dart';
import 'package:twitter/features/plus/repos/add_threads_repository.dart';

class AddThreadsViewModel extends AsyncNotifier<void> {
  late final AdddThreadsRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(addThreadsRepo);
  }

  Future<void> addThreads(String text, File file, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final uid = ref.read(authRepo).user!.uid;
      final task = await _repo.addImageForThreads(file, uid);

      if (task.metadata != null) {
        final threads =
            Threads(text: text, file: await task.ref.getDownloadURL());
        await _repo.addThreads(threads);
      }
    });

    if (state.hasError) {
      print(state.error);
    } else {
      print("Success");
      context.pop();
    }
  }
}

final addThreadsViewModel = AsyncNotifierProvider<AddThreadsViewModel, void>(
  () => AddThreadsViewModel(),
);
