import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/features/common/widgets/post_card.dart';
import 'package:twitter/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";
  static const String routeUrl = "/";

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                "assets/icons/threads.svg",
                width: 40,
                color: isDark ? Colors.white : null,
              ),
              // PostCard(
              //   username: "Nico",
              //   time: 3,
              //   post: "안녕하세요!! 니콜라스입니닷!!!!",
              //   imageUrl: const [
              //     // "https://i.imgur.com/0CfZLcI.png",
              //     // "https://i.imgur.com/PgoOazS.png",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //   ],
              //   avatarUrl: const [
              //     //  "https://avatars.githubusercontent.com/u/3612017",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",

              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     // "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
              //     // "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //   ],
              //   replies: 201,
              //   likes: 30,
              //   certificate: true,
              //   isDarkMode: isDark,
              // ),
              // PostCard(
              //   imageUrl: const [],
              //   username: "kdy",
              //   time: 3,
              //   post: "Hello Everyone",
              //   avatarUrl: const [
              //     "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
              //     "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //   ],
              //   likes: 20,
              //   replies: 132,
              //   certificate: false,
              //   isDarkMode: isDark,
              // ),
              // PostCard(
              //   imageUrl: const [
              //     "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //   ],
              //   username: "민지",
              //   time: 3,
              //   post: "",
              //   avatarUrl: const [
              //     // "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
              //     // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     // "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
              //     // "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //     "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
              //   ],
              //   likes: 99,
              //   replies: 999,
              //   certificate: true,
              //   isDarkMode: isDark,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
