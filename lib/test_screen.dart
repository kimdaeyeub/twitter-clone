import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
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
              ),
              const PostCard(
                username: "Nico",
                time: 3,
                post: "안녕하세요!! 니콜라스입니닷!!!!",
                imageUrl: [
                  "https://i.ytimg.com/an_webp/WRkig3VeRLY/mqdefault_6s.webp?du=3000&sqp=CM7ltqcG&rs=AOn4CLCToDtraHQZDpm_ilDRXZ6M9soSWg",
                  "https://i.ytimg.com/an_webp/qrpyswoATQ8/mqdefault_6s.webp?du=3000&sqp=CPOotqcG&rs=AOn4CLCrfiwgJG5raffsxIrGBUZy9sK-Lg",
                ],
                avatarUrl: [
                  "https://avatars.githubusercontent.com/u/3612017",
                  "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                  "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                  "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                ],
                replies: 201,
                likes: 30,
                certificate: true,
              ),
              const PostCard(
                imageUrl: [],
                username: "kdy",
                time: 3,
                post: "Hello Everyone",
                avatarUrl: [
                  "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                  "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                  "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                  "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                ],
                likes: 20,
                replies: 132,
                certificate: false,
              ),
              const PostCard(
                imageUrl: [
                  "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                ],
                username: "민지",
                time: 3,
                post: "",
                avatarUrl: [
                  "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                  "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                  "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                  "https://src.hidoc.co.kr/image/lib/2021/4/28/1619598179113_0.jpg",
                ],
                likes: 99,
                replies: 999,
                certificate: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final List<String> imageUrl;
  final String username;
  final int time;
  final String post;
  final List<String> avatarUrl;
  final int replies;
  final int likes;
  final bool certificate;
  const PostCard({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.time,
    required this.post,
    required this.avatarUrl,
    required this.replies,
    required this.likes,
    required this.certificate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CircleAvatar(
                          radius: 25,
                          foregroundImage: NetworkImage(
                            avatarUrl[0],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Expanded(
                  child: VerticalDivider(
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          foregroundImage: NetworkImage(
                            avatarUrl[1],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 8,
                          foregroundImage: NetworkImage(
                            avatarUrl[2],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 8,
                          foregroundImage: NetworkImage(
                            avatarUrl[3],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        if (certificate)
                          const SizedBox(
                            width: 15,
                            height: 15,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: FaIcon(
                                    FontAwesomeIcons.certificate,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 8,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${time}m",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: 17,
                        ),
                      ],
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (post != "") ...[
                      Text(
                        post,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                    if (imageUrl.isNotEmpty) ...[
                      SizedBox(
                        width: 300,
                        height: 225,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var image in imageUrl) ...[
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                    const Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          FontAwesomeIcons.arrowsRotate,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          color: Colors.black,
                          FontAwesomeIcons.paperPlane,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$replies replies • ${likes}K likes",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
