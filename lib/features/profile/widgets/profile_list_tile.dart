import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreenListTile extends StatelessWidget {
  final String myname;
  final String myImage;
  final int time;
  final String myText;
  final bool hasReplies;
  final String replyUsername;
  final String replyUserImage;
  final String replyText;
  final int replyCount;
  final String replyImage;
  final bool isDark;
  const ProfileScreenListTile({
    super.key,
    required this.myname,
    required this.myImage,
    required this.time,
    required this.myText,
    required this.hasReplies,
    required this.replyUsername,
    required this.replyUserImage,
    required this.replyText,
    required this.replyCount,
    required this.replyImage,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: CircleAvatar(
        radius: 25,
        foregroundImage: NetworkImage(
          myImage,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            myname,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Text(
                "${time}h",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: isDark ? Colors.grey.shade700 : null,
              ),
            ],
          )
        ],
      ),
      subtitle: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              myText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: isDark ? Colors.grey.shade400 : null,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (hasReplies)
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            foregroundImage: NetworkImage(
                              replyUserImage,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            replyUsername,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: isDark ? Colors.grey.shade500 : null,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        replyText,
                        style: TextStyle(
                          fontSize: 17,
                          color: isDark ? Colors.grey.shade400 : null,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ...[
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Image.network(
                              replyImage,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                      Text(
                        "$replyCount replies",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  color: isDark ? Colors.grey.shade400 : Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                FaIcon(
                  FontAwesomeIcons.comment,
                  color: isDark ? Colors.grey.shade400 : Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                FaIcon(
                  FontAwesomeIcons.arrowsRotate,
                  color: isDark ? Colors.grey.shade400 : Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                FaIcon(
                  color: isDark ? Colors.grey.shade400 : Colors.black,
                  FontAwesomeIcons.paperPlane,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
