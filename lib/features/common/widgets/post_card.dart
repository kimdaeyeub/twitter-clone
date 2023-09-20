import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/home/views/widgets/ellpsis_bottom_sheet.dart';

class PostCard extends StatelessWidget {
  final List<String> imageUrl;
  final String username;
  final int time;
  final String post;
  final List<String> avatarUrl;
  final int replies;
  final int likes;
  final bool certificate;
  final bool isDarkMode;
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
    required this.isDarkMode,
  });

  void _showBottomSheetForOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => const EllpsisBottomSheet(),
    );
  }

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
                          foregroundImage: avatarUrl[0] != ""
                              ? NetworkImage(
                                  avatarUrl[0],
                                )
                              : null,
                          foregroundColor:
                              const Color.fromARGB(255, 82, 152, 210),
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
                  child: avatarUrl[1] != ""
                      ? Stack(
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
                        )
                      : null,
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
                        GestureDetector(
                          onTap: () => _showBottomSheetForOption(context),
                          child: FaIcon(
                            FontAwesomeIcons.ellipsis,
                            size: 17,
                            color: isDarkMode ? Colors.grey.shade500 : null,
                          ),
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
                        style: TextStyle(
                          fontSize: 17,
                          color: isDarkMode ? null : Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                    if (imageUrl[0] != "") ...[
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
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color:
                              isDarkMode ? Colors.grey.shade400 : Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color:
                              isDarkMode ? Colors.grey.shade400 : Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          FontAwesomeIcons.arrowsRotate,
                          color:
                              isDarkMode ? Colors.grey.shade400 : Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        FaIcon(
                          color:
                              isDarkMode ? Colors.grey.shade400 : Colors.black,
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
