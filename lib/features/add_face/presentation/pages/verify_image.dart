import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image/image.dart' as CropImage;

class VerifyImagePage extends StatefulWidget {
  @override
  _VerifyImagePageState createState() => _VerifyImagePageState();
}

class _VerifyImagePageState extends State<VerifyImagePage> {
  PageController _facePageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _facePageController.dispose();
    super.dispose();
  }

  Future _detectFace() async {
    List<Face> _detectedFaces;
    Map<String, String> args = ModalRoute.of(context).settings.arguments;
    print(args['imagePath']);
    File imageFile = File(args['imagePath']);
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
    _detectedFaces = await faceDetector.processImage(visionImage);
    return _detectedFaces;
  }

  Future _facePageBuilder() async {
    List<Face> _detectedFaces = await _detectFace();

    Map<String, String> args = ModalRoute.of(context).settings.arguments;
    List<Container> _facePages = List();
    _detectedFaces.forEach((Face face) async {
      Rect boundingBox = face.boundingBox;
      CropImage.Image _inputImage =
          CropImage.decodeImage(File(args['imagePath']).readAsBytesSync());
      print("${_inputImage.width}, ${_inputImage.height}");
      print(boundingBox.left.toInt());
      print(boundingBox.top.toInt());
      print(boundingBox.right.toInt());
      print(boundingBox.bottom.toInt());
      CropImage.Image croppedFile = CropImage.copyCrop(
          _inputImage,
          boundingBox.left.toInt(), boundingBox.top.toInt(), boundingBox.width.toInt(), boundingBox.height.toInt());
      _facePages.add(Container(
        child: Center(
          child: Image.memory(CropImage.encodePng(croppedFile)),
        ),
      ));
    });

    return _facePages;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: _facePageBuilder(),
          builder: (context, snapshot) {
            return PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return snapshot.data[index];
              },
            );
          }),
    );
  }
}
