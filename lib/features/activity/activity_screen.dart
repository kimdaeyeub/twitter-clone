import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

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
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
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
                      isSelected: _currentTab == 0,
                      text: "All",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isSelected: _currentTab == 1,
                      text: "Replies",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isSelected: _currentTab == 2,
                      text: "Mentions",
                    ),
                  ),
                  Tab(
                    child: ActivityTab(
                      isSelected: _currentTab == 3,
                      text: "Video",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.black : null,
        border: isSelected ? null : Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
