import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/activity/widgets/activity_list_tile.dart';
import 'package:twitter/features/activity/widgets/activity_tab.dart';
import 'package:twitter/utils.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  static const String routeName = "activity";
  static const String routeUrl = "/activity";

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _currentTab = 0;

  void _onTap(int value) {
    _currentTab = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Activity",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                labelPadding: const EdgeInsets.only(right: 10),
                indicatorColor: Colors.transparent,
                isScrollable: true,
                padding: EdgeInsets.zero,
                onTap: _onTap,
                tabs: [
                  Tab(
                    child: ActivityTab(
                      isDark: isDark,
                      isSelected: _currentTab == 0,
                      text: "All",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isDark: isDark,
                      isSelected: _currentTab == 1,
                      text: "Replies",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isDark: isDark,
                      isSelected: _currentTab == 2,
                      text: "Mentions",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isDark: isDark,
                      isSelected: _currentTab == 3,
                      text: "Video",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const SingleChildScrollView(
                      child: Column(
                        children: [
                          ActivityListTile(
                            icon: FontAwesomeIcons.user,
                            color: Colors.pink,
                            avatarImage:
                                "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                            username: "kimdaeyeub",
                            time: 3,
                            title: "Hello",
                            subtitle: "Follow",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.heart,
                            color: Colors.deepPurple,
                            avatarImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            username: "Minji",
                            time: 3,
                            title: "Mentioned you",
                            subtitle:
                                "Here's a thread you should follow if you love botany @jane_mobbin",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.user,
                            color: Colors.pink,
                            avatarImage:
                                "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                            username: "kimdaeyeub",
                            time: 3,
                            title: "Hello",
                            subtitle: "Follow",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.heart,
                            color: Colors.deepPurple,
                            avatarImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            username: "Minji",
                            time: 3,
                            title: "Mentioned you",
                            subtitle:
                                "Here's a thread you should follow if you love botany @jane_mobbin",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.user,
                            color: Colors.pink,
                            avatarImage:
                                "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                            username: "kimdaeyeub",
                            time: 3,
                            title: "Hello",
                            subtitle: "Follow",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.heart,
                            color: Colors.deepPurple,
                            avatarImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            username: "Minji",
                            time: 3,
                            title: "Mentioned you",
                            subtitle:
                                "Here's a thread you should follow if you love botany @jane_mobbin",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.user,
                            color: Colors.pink,
                            avatarImage:
                                "https://news.samsungdisplay.com/wp-content/uploads/2018/08/8.jpg",
                            username: "kimdaeyeub",
                            time: 3,
                            title: "Hello",
                            subtitle: "Follow",
                          ),
                          ActivityListTile(
                            icon: FontAwesomeIcons.heart,
                            color: Colors.deepPurple,
                            avatarImage:
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            username: "Minji",
                            time: 3,
                            title: "Mentioned you",
                            subtitle:
                                "Here's a thread you should follow if you love botany @jane_mobbin",
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < 3; i++)
                      const Center(
                        child: Text("hello"),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
