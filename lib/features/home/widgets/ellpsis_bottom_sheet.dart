import 'package:flutter/material.dart';
import 'package:twitter/features/home/widgets/report_screen.dart';

class EllpsisBottomSheet extends StatelessWidget {
  const EllpsisBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 245, 245, 245),
                ),
                child: const Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: Text(
                        "Unfollow",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: Text(
                        "Mute",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 245, 245, 245),
                ),
                child: Column(
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: Text(
                        "Hide",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => Container(
                            height: 600,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ReportScreen(),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      title: const Text(
                        "Report",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
