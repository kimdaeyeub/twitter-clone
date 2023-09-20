import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/features/common/widgets/post_card.dart';
import 'package:twitter/features/home/view_model/get_threads_view_model.dart';
import 'package:twitter/utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";
  static const String routeUrl = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(context, ref);

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
              ref.watch(getThreadsViewModel).when(
                    error: (error, stackTrace) => Center(
                      child: Text(
                        error.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    data: (data) {
                      return PostCard(
                        imageUrl: const [
                          "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                        ],
                        username: "민지",
                        time: 3,
                        post: "",
                        avatarUrl: const [
                          // "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          // "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                          // "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                          // "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                          "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                          "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                          "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                          "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                        ],
                        likes: 99,
                        replies: 999,
                        certificate: true,
                        isDarkMode: isDark,
                      );
                    },
                  )
            ],
          ),
        ),
      ),
    );
  }
}
