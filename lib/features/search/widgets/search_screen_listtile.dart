import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreenListTile extends StatelessWidget {
  final String username;
  final String description;
  final String userImage;
  final String comment;
  final String commentImage;
  const SearchScreenListTile({
    super.key,
    required this.username,
    required this.description,
    required this.userImage,
    required this.comment,
    required this.commentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          foregroundImage: userImage != "" ? NetworkImage(userImage) : null,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
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
                                  size: 19,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: FaIcon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 1,
                    // ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        if (commentImage != "") ...[
                          CircleAvatar(
                            radius: 10,
                            foregroundImage: NetworkImage(commentImage),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                        Text(
                          comment,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Follow",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
