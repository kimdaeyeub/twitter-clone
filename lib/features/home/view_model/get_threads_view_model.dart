import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/home/repo/home_repository.dart';

class GetThreadsViewModel extends AsyncNotifier<void> {
  late final HomeRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(homeRepo);
  }

  Future<void> getThreads() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final threads = await _repo.getThreads();
      print(threads);
    });
  }
}

final getThreadsViewModel = AsyncNotifierProvider<GetThreadsViewModel, void>(
  () => GetThreadsViewModel(),
);
