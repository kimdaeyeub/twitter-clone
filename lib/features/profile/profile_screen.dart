import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/common/widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  title: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.globe,
                          size: 30,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FaIcon(
                              FontAwesomeIcons.barsStaggered,
                              size: 30,
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
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        "threads.net",
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
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
                                              backgroundColor: Colors.pink,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: CircleAvatar(
                                              radius: 20,
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
                  delegate: CustomPersistentHeader(),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
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
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Replies",
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
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: const CircleAvatar(
        radius: 25,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Jane_mobbin",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Text(
                "3h",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const FaIcon(
                FontAwesomeIcons.ellipsis,
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
            const Text(
              "Give @john_mobbin a follow if you want to see more travel content!",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "earthpix",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
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
                    const Text(
                      "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.network(
                        "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "256 replies",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
          ],
        ),
      ),
    );
  }
}

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
        labelPadding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        tabs: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
