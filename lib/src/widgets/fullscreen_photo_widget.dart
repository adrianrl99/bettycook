import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPhotoWidget extends StatelessWidget {
  final String imagePath;
  const FullScreenPhotoWidget({required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: AssetImage(this.imagePath),
        ),
      ),
    );
  }
}
