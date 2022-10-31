import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/widgets/full_screen_storyview.dart';

import '../models/story_image_model.dart';

class InstaStoryController extends GetxController {
  void onClick() {
    update();
  }
}
