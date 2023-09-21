import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/search/view_model/search_view_model.dart';
import 'package:twitter/features/search/widgets/search_screen_listtile.dart';
import 'package:twitter/utils.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  static const String routeName = "search";
  static const String routeUrl = "search";

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context, ref);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoSearchTextField(
                controller: _searchController,
                onChanged: (value) {
                  ref.read(searchFormText.notifier).state =
                      _searchController.text;
                  ref.read(searchViewModel.notifier).search();
                  setState(() {});
                },
                backgroundColor: isDark ? Colors.grey.shade900 : null,
                itemColor: isDark ? Colors.grey.shade400 : Colors.grey.shade500,
              ),
            ),
          ),
        ),
        body: ref.watch(searchViewModel).when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    print(data[0]);

                    return Center(
                      child: Text(data[index].text),
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}
