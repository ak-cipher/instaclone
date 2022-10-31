import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String userID;
  String postImageUrl;

  PostModel({required this.userID, required this.postImageUrl});

  factory PostModel.fromJson(DocumentSnapshot postSnapshotData) {
    return PostModel(
        userID: postSnapshotData.get('UserID'),
        postImageUrl: postSnapshotData.get('postImageUrl'));
  }
}
