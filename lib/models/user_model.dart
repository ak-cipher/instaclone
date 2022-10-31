import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String id;
  String profileImageUrl;

  UserModel(
      {required this.name, required this.id, required this.profileImageUrl});

  factory UserModel.fromJson(DocumentSnapshot userSnapshot) {
    return UserModel(
        name: userSnapshot.get('name'),
        id: userSnapshot.get('id'),
        profileImageUrl: userSnapshot.get('profileImageUrl'));
  }
}
