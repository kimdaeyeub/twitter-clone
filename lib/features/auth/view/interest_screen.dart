import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/auth/view/interest_part_two_screen.dart';
import 'package:twitter/features/auth/view/widgets/interest_button.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<Map<String, dynamic>> interests = [
    {
      "name": "Daily Life",
      "selected": false,
    },
    {
      "name": "Comedy",
      "selected": false,
    },
    {
      "name": "Entertainment",
      "selected": false,
    },
    {
      "name": "Animals",
      "selected": false,
    },
    {
      "name": "Food",
      "selected": false,
    },
    {
      "name": "Beauty & Style",
      "selected": false,
    },
    {
      "name": "Drama",
      "selected": false,
    },
    {
      "name": "Learning",
      "selected": false,
    },
    {
      "name": "Talent",
      "selected": false,
    },
    {
      "name": "Sports",
      "selected": false,
    },
    {
      "name": "Auto",
      "selected": false,
    },
    {
      "name": "Family",
      "selected": false,
    },
    {
      "name": "Fitness & Health",
      "selected": false,
    },
    {
      "name": "DIY & Life Hacks",
      "selected": false,
    },
    {
      "name": "Arts & Crafts",
      "selected": false,
    },
    {
      "name": "Dance",
      "selected": false,
    },
    {
      "name": "Outdoors",
      "selected": false,
    },
    {
      "name": "Oddly Satisfying",
      "selected": false,
    },
    {
      "name": "Home & Garden",
      "selected": false,
    },
    {
      "name": "Daily Life",
      "selected": false,
    },
    {
      "name": "Comedy",
      "selected": false,
    },
    {
      "name": "Entertainment",
      "selected": false,
    },
    {
      "name": "Animals",
      "selected": false,
    },
    {
      "name": "Food",
      "selected": false,
    },
    {
      "name": "Beauty & Style",
      "selected": false,
    },
    {
      "name": "Drama",
      "selected": false,
    },
    {
      "name": "Learning",
      "selected": false,
    },
    {
      "name": "Talent",
      "selected": false,
    },
    {
      "name": "Sports",
      "selected": false,
    },
    {
      "name": "Auto",
      "selected": false,
    },
    {
      "name": "Family",
      "selected": false,
    },
    {
      "name": "Fitness & Health",
      "selected": false,
    },
    {
      "name": "DIY & Life Hacks",
      "selected": false,
    },
    {
      "name": "Arts & Crafts",
      "selected": false,
    },
    {
      "name": "Dance",
      "selected": false,
    },
    {
      "name": "Outdoors",
      "selected": false,
    },
    {
      "name": "Oddly Satisfying",
      "selected": false,
    },
    {
      "name": "Home & Garden",
      "selected": false,
    },
  ];
  int _counter = 0;
  bool _permissionForMoveScreen = false;
  void _onTapInterestIcon(int index) {
    if (interests[index]['selected']) {
      _counter -= 1;
    } else {
      _counter += 1;
    }
    interests[index]['selected'] = !interests[index]['selected'];
    if (_counter >= 3) {
      _permissionForMoveScreen = true;
    } else {
      _permissionForMoveScreen = false;
    }
    setState(() {});
  }

  void _onMoveNextScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestPartTwoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$_counter of 3 selected",
              ),
              GestureDetector(
                onTap: _permissionForMoveScreen ? _onMoveNextScreen : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: _permissionForMoveScreen
                        ? Colors.black
                        : Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "What do you want to see on Twitter?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 17,
              ),
            ),
            const Divider(
              height: 40,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: interests.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 20 / 9,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onTapInterestIcon(index),
                    child: InterestButton(
                      text: interests[index]["name"],
                      isSelected: interests[index]['selected'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
