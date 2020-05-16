import 'package:app/features/add_face/presentation/widgets/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';

class CaptureMediaPage extends StatefulWidget {
  @override
  _CaptureMediaPageState createState() => _CaptureMediaPageState();
}

class _CaptureMediaPageState extends State<CaptureMediaPage> {
  CameraController _cameraController;
  List<CameraDescription> cameras;
  int selectedCameraIdx;

  @override
  void initState() {

    availableCameras()
        .then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
      }
    })
        .catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });

    Camera(cameras, setImagePreview);

    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void setImagePreview(bytesImage) {
  }

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController.dispose();
    }


    _cameraController = CameraController(cameraDescription, ResolutionPreset.medium);

    // If the controller is updated then update the UI.
    _cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (_cameraController.value.hasError) {
      }
    });


    try {
      await _cameraController.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx = selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _onCameraSwitched(selectedCamera);
    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }


  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  Widget _cameraToggleWidget() {
    if (cameras == null) {
      return Row();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Container(
      child: IconButton(
        onPressed: _onSwitchCamera,
        icon: Icon(
          _getCameraLensIcon(lensDirection), color: Colors.white,
        ),
      ),
    );
  }

  Future _takePictureGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    final String _imageFilePath = image.path;
    Navigator.pushNamed(context, "/verifymedia", arguments: {'imagePath': _imageFilePath});
  }

  void _takePictureCamera() async{
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String imageDirectory = '${appDirectory.path}/tmp/media/';
    await Directory(imageDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String _imageFilePath = '$imageDirectory/$currentTime.png';
    await _cameraController.takePicture(_imageFilePath);
    File _rotatedImage = await FlutterExifRotation.rotateImage(path: _imageFilePath);
    print(_rotatedImage.path);
    Navigator.pushNamed(context, "/verifymedia", arguments: {'imagePath': _rotatedImage.path});
    _cameraController.dispose();
  }

  Widget _bodyBuilder() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: AspectRatio(
                aspectRatio: _cameraController.value.aspectRatio,
                child: CameraPreview(_cameraController),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _cameraToggleWidget(),
                    GestureDetector(
                      onTap: () async{
                        _takePictureCamera();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightGreenAccent, width: 2.0),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async{
                        _takePictureGallery();
                      },
                      icon: Icon(Icons.cloud_upload, color: Colors.black,),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
    );
  }
}
