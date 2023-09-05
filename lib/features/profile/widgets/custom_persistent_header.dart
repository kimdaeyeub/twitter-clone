import 'package:flutter/material.dart';

class CustomPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 248, 248, 248),
      ),
      child: const TabBar(
        labelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        tabs: [
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
