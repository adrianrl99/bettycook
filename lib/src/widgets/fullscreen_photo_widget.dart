import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPhotoWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  const FullScreenPhotoWidget({required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: image,
        ),
      ),
    );
  }
}
