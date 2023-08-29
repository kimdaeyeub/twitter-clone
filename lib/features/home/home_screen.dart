import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/icons/threads.svg",
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Row(
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 27,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: VerticalDivider(
                          color: Colors.grey.shade400,
                          width: 30,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CircleAvatar(
                        radius: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Vine after seeing the Threads logo unveiled",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            "https://cdn.travie.com/news/photo/first/201710/img_19975_1.jpg",
                            height: 230,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FaIcon(
                              FontAwesomeIcons.comment,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FaIcon(
                              FontAwesomeIcons.arrowsRotate,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FaIcon(
                              FontAwesomeIcons.paperPlane,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text("2 replies • 63 likes")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
