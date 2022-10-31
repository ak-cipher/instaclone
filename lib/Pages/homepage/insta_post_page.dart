import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Pages/homepage/Insta_stories.dart';
import 'package:instagram_clone/widgets/single_post_widget.dart';

import '../../models/user_model.dart';
import '../../models/post_model.dart';

class InstaPostViewWidget extends StatefulWidget {
  const InstaPostViewWidget({super.key});

  @override
  State<InstaPostViewWidget> createState() => _InstaPostViewWidgetState();
}

class _InstaPostViewWidgetState extends State<InstaPostViewWidget> {
  StreamSubscription<QuerySnapshot>? postSubscription;
  StreamSubscription<QuerySnapshot>? userSubscription;
  List<UserModel>? userDetailsList;
  List<PostModel>? postDetailsList;
  CollectionReference postCollectionRefrence =
      FirebaseFirestore.instance.collection('Posts');
  CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();
    userSubscription =
        userCollectionReference.snapshots().listen((userSnapshotData) {
      userDetailsList = userSnapshotData.docs
          .map((singleUserData) => UserModel.fromJson(singleUserData))
          .toList();
    });
    postSubscription =
        postCollectionRefrence.snapshots().listen((postSnapshotData) {
      setState(() {
        postDetailsList = postSnapshotData.docs
            .map((singlePostData) => PostModel.fromJson(singlePostData))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return postDetailsList != null
        ? ListView.builder(
            itemCount: postDetailsList!.length + 1,
            itemBuilder: ((context, index) {
              if (index == 0) {
                return InstaStories(userModel :userDetailsList![0]);
              } else {
                UserModel? user;
                for (int i = 0; i < userDetailsList!.length; i++) {
                  if (postDetailsList![index - 1].userID ==
                      userDetailsList![i].id) {
                    user = userDetailsList![i];
                    break;
                  }
                }
                return SinglePostWidget(
                    postModel: postDetailsList![index - 1], userModel: user!);
              }
            }))
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  void dispose() {
    postSubscription?.cancel();
    userSubscription?.cancel();
    super.dispose();
  }
}
