import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:instagram_clone/widgets/full_screen_storyview.dart';
import 'package:instagram_clone/controller/insta_story_controller.dart';
import 'package:instagram_clone/models/story_image_model.dart';
import 'package:get/get.dart';

class InstaStoryWidget extends StatelessWidget {
  final InstaStoryModel story;
  final DocumentSnapshot storySnapshot;
  InstaStoryWidget(
      {super.key, required this.story, required this.storySnapshot});

  InstaStoryController storyController = Get.put(InstaStoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstaStoryController>(builder: (_) {
      return InkWell(
        onTap: () {
          story.isClicked = true;
          DocumentReference storyDocument = FirebaseFirestore.instance
              .collection('Stories')
              .doc(storySnapshot.id);
          Map<String, bool> isClicked = {
            'isClicked': true,
          };
          storyDocument.update(isClicked);
          storyController.onClick();
          print("Isclicked tap");
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
            return FullScreenStoryView(url: story.storyImageUrl);
          })));
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border:
                  story.isClicked ? Border() : Border.all(color: Colors.red),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: CachedNetworkImageProvider(story.storyImageUrl), fit: BoxFit.fill)),
        ),
      );
    });
  }
}
