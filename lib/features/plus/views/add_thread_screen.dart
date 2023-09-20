import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:twitter/features/plus/views/widgets/camera_view.dart';

class AddThreadsScreen extends StatefulWidget {
  const AddThreadsScreen({super.key});

  @override
  State<AddThreadsScreen> createState() => _AddThreadsScreenState();
}

class _AddThreadsScreenState extends State<AddThreadsScreen> {
  bool _hasPermission = false;
  bool _turnOnFlash = false;
  bool _isSelfiMode = false;
  XFile? _xFile;
  late FlashMode _flashMode;
  late final bool _noCamera = Platform.isIOS && kDebugMode;

  void _onMoveBack() {
    if (_xFile != null) {
      Navigator.of(context).pop(_xFile);
    } else {
      Navigator.of(context).pop();
    }
  }

  late CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfiMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();
    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> _setFlashMode() async {
    if (_turnOnFlash) {
      await _cameraController.setFlashMode(FlashMode.off);
      _turnOnFlash = false;
    } else {
      await _cameraController.setFlashMode(FlashMode.torch);
      _turnOnFlash = true;
    }
    setState(() {});
  }

  Future<void> _toggleSelfiMode() async {
    _isSelfiMode = !_isSelfiMode;
    await initCamera();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (!_noCamera) {
      initPermissions();
    } else {
      setState(() {
        // _hasPermission = true;
      });
    }
  }

  Future<void> _takePicture() async {
    final xFile = await _cameraController.takePicture();
    _xFile = xFile;
    setState(() {});
  }

  void _resetImage() {
    _xFile = null;
    setState(() {});
  }

  Future<void> _getImageFromGallery() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _xFile = xFile;
    setState(() {});
    _onMoveBack();
  }

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
              child: Scaffold(
                backgroundColor: const Color(0xff171713),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      _hasPermission &&
                              _cameraController.value.isInitialized &&
                              !_noCamera
                          ? _xFile == null
                              ? CameraPreview(_cameraController)
                              : Image.file(
                                  File(
                                    _xFile!.path,
                                  ),
                                )
                          : Positioned.fill(
                              child: Container(
                                color: const Color(0xff171713),
                              ),
                            ),
                      if (_xFile != null)
                        Positioned(
                          top: 65,
                          right: 15,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: _onMoveBack,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: _resetImage,
                                child: const FaIcon(
                                  FontAwesomeIcons.xmark,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Positioned(
                        top: 65,
                        left: 15,
                        child: GestureDetector(
                          onTap: _onMoveBack,
                          child: const FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => _setFlashMode(),
                                child: FaIcon(
                                  FontAwesomeIcons.bolt,
                                  color: _turnOnFlash
                                      ? Colors.amber.shade400
                                      : Colors.white,
                                  size: 28,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.white,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: _takePicture,
                                      child: Container(
                                        height: 75,
                                        width: 75,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: _toggleSelfiMode,
                                child: const FaIcon(
                                  FontAwesomeIcons.rotate,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
            GestureDetector(
              onTap: _getImageFromGallery,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    "Library",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
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
