import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/profile/views/settings_screen.dart';
import 'package:twitter/features/profile/views/widgets/custom_persistent_header.dart';
import 'package:twitter/features/profile/views/widgets/profile_list_tile.dart';
import 'package:twitter/utils.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = "profile";
  static const String routeUrl = "/profile";

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void _onMoveSettingsScreenForWeb() {
    context.goNamed(SettingsScreen.routeName);
  }

  void _onMoveSettingsScreenForMobile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context, ref);
    const isWeb = kIsWeb;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.globe,
                          size: 30,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: isWeb
                                  ? _onMoveSettingsScreenForWeb
                                  : _onMoveSettingsScreenForMobile,
                              child: const FaIcon(
                                FontAwesomeIcons.barsStaggered,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jane",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "jane_mobbin",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: isDark
                                            ? Colors.grey.shade800
                                            : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "threads.net",
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.grey.shade300
                                              : Colors.grey.shade600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Plant enthusiast!",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 70,
                                      height: 50,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: CircleAvatar(
                                              radius: 20,
                                              foregroundImage: NetworkImage(
                                                "https://img.freepik.com/free-vector/pretty-night-landscape-watercolor-background-with-stars_23-2147658499.jpg",
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: CircleAvatar(
                                              radius: 20,
                                              foregroundImage: NetworkImage(
                                                "https://mblogthumb-phinf.pstatic.net/MjAxODEwMTJfMTI2/MDAxNTM5MjcwODAwOTEy.LOiaGHZPq1q_sOc0d0BF_xd8_YT-23rvAdPisysoOqEg.SUhDZiPnD0Ugj0xZYxCJRmbjIJAVIs242UaHB3Amr9kg.PNG.mentorkh/%EC%98%88%EC%81%9C%ED%95%98%EB%8A%98_%EA%B0%90%EC%84%B1%EC%9D%B4%EB%AF%B8%EC%A7%80_%EB%B0%B0%EA%B2%BD%ED%99%94%EB%A9%B4__%2820%29.png?type=w800",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "2 followers",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const CircleAvatar(
                              radius: 35,
                              foregroundImage: NetworkImage(
                                "https://mblogthumb-phinf.pstatic.net/MjAxODEwMTJfMjgz/MDAxNTM5MjcwNzk5NDMz._RguaLGCU8YJg8-bjtjSYl64y6hZ8Twk0bn_Q3436iog.FXXHZM-E9K8AKuzoum4zbzL3-3oMnMLWSVRRV_IoGMwg.PNG.mentorkh/%EC%98%88%EC%81%9C%ED%95%98%EB%8A%98_%EA%B0%90%EC%84%B1%EC%9D%B4%EB%AF%B8%EC%A7%80_%EB%B0%B0%EA%B2%BD%ED%99%94%EB%A9%B4__%281%29.png?type=w800",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  "Edit profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  "Share profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomPersistentHeader(
                    isDark: isDark,
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          ProfileScreenListTile(
                            myname: "jane_mobbin",
                            myImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            time: 3,
                            myText:
                                "Give @john_mobbin a follow if you want to see more travel content!",
                            hasReplies: true,
                            replyUsername: "Minji",
                            replyUserImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            replyText:
                                "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                            replyCount: 200,
                            replyImage:
                                "https://www.vogue.co.kr/wp_data/vogue/2017/03/style_58d5042e102a9.jpg",
                            isDark: isDark,
                          ),
                          Divider(
                            height: 30,
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                          ProfileScreenListTile(
                            myname: "jane_mobbin",
                            myImage:
                                "https://i.pinimg.com/originals/d4/a3/12/d4a312cc3d977468137ec857a84fd4e1.jpg",
                            time: 5,
                            myText:
                                "Give @john_mobbin a follow if you want to see more travel content!",
                            hasReplies: false,
                            replyUsername: "Daeyeub",
                            replyUserImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            replyText:
                                "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                            replyCount: 200,
                            replyImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            isDark: isDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileScreenListTile(
                          myname: "jane_mobbin",
                          myImage:
                              "https://i.pinimg.com/originals/d4/a3/12/d4a312cc3d977468137ec857a84fd4e1.jpg",
                          time: 2,
                          myText:
                              "Give @john_mobbin a follow if you want to see more travel content!",
                          hasReplies: false,
                          replyUsername: "Minji",
                          replyUserImage:
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          replyText:
                              "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                          replyCount: 200,
                          replyImage:
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          isDark: isDark,
                        ),
                        Divider(
                          height: 30,
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                        ProfileScreenListTile(
                          myname: "jane_mobbin",
                          myImage:
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          time: 9,
                          myText:
                              "Give @john_mobbin a follow if you want to see more travel content!",
                          hasReplies: true,
                          replyUsername: "Minji",
                          replyUserImage:
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          replyText:
                              "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                          replyCount: 200,
                          replyImage:
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
