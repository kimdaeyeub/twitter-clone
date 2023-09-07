import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraViewScreen extends StatefulWidget {
  const CameraViewScreen({super.key});

  @override
  State<CameraViewScreen> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraViewScreen> {
  bool _hasPermission = false;
  bool _turnOnFlash = false;
  bool _isSelfiMode = false;
  XFile? _xFile;
  late FlashMode _flashMode;
  void _onMoveBack() {
    Navigator.of(context).pop();
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
    initPermissions();
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
    print(xFile);
    _xFile = xFile;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171713),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _hasPermission && _cameraController.value.isInitialized
                ? _xFile == null
                    ? CameraPreview(_cameraController)
                    : Stack(
                        children: [
                          Image.file(
                            File(
                              _xFile!.path.toString(),
                            ),
                          ),
                          Positioned(
                            top: 65,
                            right: 15,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "사용하기",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: _resetImage,
                                  child: const FaIcon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                : Positioned.fill(
                    child: Container(
                      color: Colors.amber,
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
                      child: const FaIcon(
                        FontAwesomeIcons.bolt,
                        color: Colors.white,
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
    );
  }
}
