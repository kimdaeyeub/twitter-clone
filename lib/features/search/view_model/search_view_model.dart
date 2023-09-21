import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/plus/models/threads_model.dart';
import 'package:twitter/features/search/repos/search_repository.dart';

class SearchViewModel extends AsyncNotifier<List<Threads>> {
  late final SearchRepository _repo;
  List<Threads> _list = [];

  @override
  FutureOr<List<Threads>> build() async {
    _repo = ref.read(searchRepos);
    _list = await search();
    return _list;
  }

  Future<List<Threads>> search() async {
    final value = ref.read(searchFormText);
    final result = await _repo.search(value);
    final threads =
        result.docs.map((data) => Threads.formJson(data.data())).toList();
    return threads;
  }
}

final searchViewModel = AsyncNotifierProvider<SearchViewModel, List<Threads>>(
  () => SearchViewModel(),
);
final searchFormText = StateProvider((ref) => "");
