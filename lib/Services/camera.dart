import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraImageService {
  Future<File?> pickImageFromGalley() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return null;

      final imageTemp = File(image.path);

      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to load image : $e');
    }
  }

  Future<File?> pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return null;

      final imageTemp = File(image.path);

      return imageTemp;
    } on PlatformException catch (e) {
      print('failed to load image : $e');
    }
  }
}
