import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/features/plus/view_models/add_threads_view_model.dart';
import 'package:twitter/features/plus/views/add_thread_screen.dart';

class AddThreadModalBottomSheet extends ConsumerStatefulWidget {
  const AddThreadModalBottomSheet({
    super.key,
  });

  @override
  ConsumerState<AddThreadModalBottomSheet> createState() =>
      _AddThreadModalBottomSheetState();
}

class _AddThreadModalBottomSheetState
    extends ConsumerState<AddThreadModalBottomSheet> {
  final TextEditingController _textController = TextEditingController();

  String _text = "";
  XFile? _xFile;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      _text = _textController.text;
      setState(() {});
    });
  }

  void _onAddThreadsScreen() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddThreadsScreen(),
      ),
    );
    _xFile = result;
    setState(() {});
  }

  void _onSubmit() {
    print(_xFile!.path);
    ref.read(addThreadsViewModel.notifier).addThreads(
          _text,
          File(_xFile!.path),
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "New thread",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Divider(
                      // height: 30,
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            foregroundImage: NetworkImage(
                              "https://img.hankyung.com/photo/202208/03.30909476.1.jpg",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 100,
                            child: VerticalDivider(
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 18,
                            foregroundImage: NetworkImage(
                                "https://img.hankyung.com/photo/202208/03.30909476.1.jpg"),
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
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "kdy",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _textController,
                              maxLines: 2,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "Start a thread...",
                                hintStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                ),
                                // filled: true,
                                // fillColor: Colors.teal,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            if (_xFile != null) ...[
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.file(
                                  File(_xFile!.path),
                                ),
                              ),
                            ],
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: _onAddThreadsScreen,
                              child: FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: Colors.grey.shade400,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anyone can reply",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_text != "") {
                          _onSubmit();
                        }
                      },
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color:
                              _text == "" ? Colors.blue.shade200 : Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
