import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/home/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  void _onMoveTap(int value) {
    _selectedIndex = value;
    setState(() {});
  }

  void _addPost() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        height: 800,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "New thread",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 25,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 200,
                          child: VerticalDivider(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "kdy",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade400,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Text("data"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _onMoveTap(0),
                child: Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.house,
                    size: 28,
                    color: _selectedIndex == 0
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onMoveTap(1),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 28,
                    color: _selectedIndex == 1
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onMoveTap(2);
                  _addPost();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: 28,
                    color: _selectedIndex == 2
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onMoveTap(3),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.heart,
                    size: 28,
                    color: _selectedIndex == 3
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onMoveTap(4),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 28,
                    color: _selectedIndex == 4
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Center(
              child: Text(
                "Search",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Center(
              child: Text(
                "Write",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Center(
              child: Text(
                "Likes",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
