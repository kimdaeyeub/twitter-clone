import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/home/repo/home_repository.dart';
import 'package:twitter/features/plus/models/threads_model.dart';

class GetThreadsViewModel extends AsyncNotifier<List<Threads>> {
  late final HomeRepository _repo;
  List<Threads> _list = [];

  @override
  FutureOr<List<Threads>> build() async {
    _repo = ref.read(homeRepo);
    _list = await getThreads();
    return _list;
  }

  Future<List<Threads>> getThreads() async {
    final result = await _repo.getThreads();
    final threads = result.docs.map(
      (doc) => Threads.formJson(
        doc.data(),
      ),
    );
    return threads.toList();
  }

  Future<void> refresh() async {
    final thread = await getThreads();
    _list = thread;
    state = AsyncValue.data(_list);
  }
}

final getThreadsViewModel =
    AsyncNotifierProvider<GetThreadsViewModel, List<Threads>>(
  () => GetThreadsViewModel(),
);
