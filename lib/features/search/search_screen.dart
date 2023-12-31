import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/common/widgets/post_card.dart';
import 'package:twitter/features/plus/models/threads_model.dart';
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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('threads')
              .orderBy("text")
              .startAt([_searchController.text]).endAt(
                  ["${_searchController.text}\uf8ff"]).snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Text("Error"),
                  );
                }
                final data = snapshot.data!.docs[index];

                return PostCard(
                  imageUrl: [
                    data["file"],
                  ],
                  username: "anonymous",
                  time: 3,
                  post: data['text'],
                  avatarUrl: const ["", "", "", ""],
                  replies: 3,
                  likes: 4,
                  certificate: true,
                  isDarkMode: isDark,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
