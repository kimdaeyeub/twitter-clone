import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/activity/activity_screen.dart';
import 'package:twitter/features/home/views/home_screen.dart';
import 'package:twitter/features/plus/views/widgets/add_thread_modal_bottom_sheet.dart';
import 'package:twitter/features/profile/views/profile_screen.dart';
import 'package:twitter/features/search/search_screen.dart';
import 'package:twitter/utils.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key, required this.screen});
  final String screen;

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;
  final List<String> _screen = [
    "",
    "search",
    "xxxx",
    "activity",
    "profile",
  ];

  void _onMoveTap(int value) {
    if (kIsWeb) {
      context.go("/${_screen[value]}");
      _selectedIndex = value;
    } else {
      _selectedIndex = value;
    }
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
    final isDark = isDarkMode(context, ref);
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
                    color: _selectedIndex == 0
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
                    color: _selectedIndex == 1
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
                    color: _selectedIndex == 2
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
                    _selectedIndex == 3
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 28,
                    color: _selectedIndex == 3
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
                    color: _selectedIndex == 4
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
          // Offstage(
          //   offstage: _selectedIndex != 0,
          //   child: const HomeScreen(),
          //   // child: const Center(
          //   //   child: Text("Hello"),
          //   // ),
          // ),
          const HomeScreen(),
          Offstage(
            offstage: _selectedIndex != 1,
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
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
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
