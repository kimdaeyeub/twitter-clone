import 'package:flutter/material.dart';
import 'package:twitter/features/plus/widgets/camera_view.dart';

class AddThreadsScreen extends StatefulWidget {
  const AddThreadsScreen({super.key});

  @override
  State<AddThreadsScreen> createState() => _AddThreadsScreenState();
}

class _AddThreadsScreenState extends State<AddThreadsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 50,
        ),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: screenSize.height * 0.8,
              width: screenSize.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: const CameraViewScreen(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Camera",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  "Library",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
