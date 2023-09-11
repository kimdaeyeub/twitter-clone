import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/activity/activity_screen.dart';
import 'package:twitter/features/home/home_screen.dart';
import 'package:twitter/features/plus/widgets/add_thread_modal_bottom_sheet.dart';
import 'package:twitter/features/profile/profile_screen.dart';
import 'package:twitter/features/search/search_screen.dart';
import 'package:twitter/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, required this.screen});
  final String screen;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  final List<String> _screen = [
    "",
    "search",
    "xxxx",
    "activity",
    "profile",
  ];

  void _onMoveTap(int value) {
    context.go("/${_screen[value]}");
    setState(() {});
  }

  void _addPost() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        height: 850,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: const AddThreadModalBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    print(widget.screen);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: isDark ? const Color.fromARGB(255, 22, 22, 22) : null,
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
                    color: widget.screen == "home"
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : isDark
                            ? Colors.grey.shade700
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
                    color: widget.screen == "search"
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // _onMoveTap(2);
                  _addPost();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: 28,
                    color: widget.screen == "asd"
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _onMoveTap(3),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: FaIcon(
                    widget.screen == "activity"
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 28,
                    color: widget.screen == "activity"
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : isDark
                            ? Colors.grey.shade700
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
                    color: widget.screen == "profile"
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : isDark
                            ? Colors.grey.shade700
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
            offstage: widget.screen != "home",
            child: const HomeScreen(),
            // child: const Center(
            //   child: Text("Hello"),
            // ),
          ),
          Offstage(
            offstage: widget.screen != "search",
            child: const SearchScreen(),
          ),
          // Offstage(
          //   offstage: _selectedIndex != 2,
          //   child: const Center(
          //     child: Text(
          //       "Write",
          //       style: TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.w800,
          //       ),
          //     ),
          //   ),
          // ),
          Offstage(
            offstage: widget.screen != "activity",
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: widget.screen != "profile",
            child: Navigator(
              key: _key,
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
