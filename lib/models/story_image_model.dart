import 'package:cloud_firestore/cloud_firestore.dart';

class InstaStoryModel {
  String storyImageUrl;
  String id;
  bool isClicked;

  InstaStoryModel(
      {required this.storyImageUrl, required this.id, required this.isClicked});

  factory InstaStoryModel.fromJson(DocumentSnapshot doc) {
    return InstaStoryModel(
        storyImageUrl: doc.get('url'),
        id: doc.id,
        isClicked: doc.get('isClicked'));
  }
}
