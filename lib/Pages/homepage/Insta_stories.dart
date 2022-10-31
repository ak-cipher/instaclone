import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/widgets/CreateSelfStoryWidget.dart';
import 'package:instagram_clone/widgets/insta_story_widget.dart';

import '../../models/story_image_model.dart';

class InstaStories extends StatefulWidget {
  final UserModel userModel;
  const InstaStories({super.key, required this.userModel});

  @override
  State<InstaStories> createState() => _InstaStoriesState();
}

class _InstaStoriesState extends State<InstaStories> {
  StreamSubscription<QuerySnapshot>? storiesSubscription;
  CollectionReference storiesCollectionRefrence =
      FirebaseFirestore.instance.collection('Stories');
  List<InstaStoryModel>? stories;
  List<DocumentSnapshot>? storiesDocumentSnapshot;

  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
        child: Text(
          'Stories',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 0),
        child: Row(
          children: [
            Icon(Icons.play_arrow_sharp),
            Text(
              'Watch All',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      )
    ],
  );

  @override
  void initState() {
    super.initState();
    storiesSubscription =
        storiesCollectionRefrence.snapshots().listen((storiesSnapshot) {
      storiesDocumentSnapshot = storiesSnapshot.docs;
      setState(() {
        stories = storiesDocumentSnapshot
            ?.map((SingleStorySnapshot) =>
                InstaStoryModel.fromJson(SingleStorySnapshot))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topText,
        SizedBox(
          height: 5.0,
        ),
        stories != null
            ? SizedBox(
                height: 70,
                child: ListView.builder(
                    itemCount: stories!.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return index == 0
                          ? SelfStoryWidget(
                              userModel: widget.userModel,
                            )
                          : InstaStoryWidget(
                              story: stories![index-1],
                              storySnapshot: storiesDocumentSnapshot![index-1]);
                    })),
              )
            : Center(
                child: CircularProgressIndicator(),
              )
      ],
    );
  }

  @override
  void dispose() {
    storiesSubscription?.cancel();
    super.dispose();
  }
}
