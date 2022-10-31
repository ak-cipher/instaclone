import 'dart:io';

import 'package:flutter/material.dart';

class CameraGalleryImageviewWidget extends StatelessWidget {
  File? image;
  CameraGalleryImageviewWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: image != null ? Image.file(image!) : Text('No image selcted'),
      ),
    );
  }
}
