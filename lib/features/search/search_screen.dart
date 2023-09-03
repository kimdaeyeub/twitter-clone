import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/search/widgets/search_screen_listtile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Search",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CupertinoSearchTextField(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SearchScreenListTile(
                        username: "KimDaeYeub",
                        description: "Very Cool Guy",
                        userImage:
                            "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                        comment: "89K followers",
                        commentImage: "",
                      ),
                      SearchScreenListTile(
                        username: "asdasdk",
                        description: "Very Cool Guy",
                        userImage:
                            "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                        comment: "200K followers",
                        commentImage:
                            "https://image.edaily.co.kr/images/Photo/files/NP/S/2017/07/PS17072900100.jpg",
                      ),
                      SearchScreenListTile(
                        username: "KimDaeYeub",
                        description: "Very Cool Guy",
                        userImage:
                            "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                        comment: "89K followers",
                        commentImage: "",
                      ),
                      SearchScreenListTile(
                        username: "asdasdk",
                        description: "Very Cool Guy",
                        userImage:
                            "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                        comment: "200K followers",
                        commentImage:
                            "https://image.edaily.co.kr/images/Photo/files/NP/S/2017/07/PS17072900100.jpg",
                      ),
                      SearchScreenListTile(
                        username: "KimDaeYeub",
                        description: "Very Cool Guy",
                        userImage:
                            "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                        comment: "89K followers",
                        commentImage: "",
                      ),
                      SearchScreenListTile(
                        username: "asdasdk",
                        description: "Very Cool Guy",
                        userImage:
                            "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                        comment: "200K followers",
                        commentImage:
                            "https://image.edaily.co.kr/images/Photo/files/NP/S/2017/07/PS17072900100.jpg",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
