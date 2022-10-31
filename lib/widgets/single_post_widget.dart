import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clone/controller/insta_post_controller.dart';
import 'package:instagram_clone/models/post_model.dart';

import '../models/user_model.dart';

class SinglePostWidget extends StatelessWidget {
  PostModel postModel;
  UserModel userModel;
  bool tapped = false;
  SinglePostWidget(
      {super.key, required this.postModel, required this.userModel});

  InstaPostController instaPostController = Get.put(InstaPostController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0)),
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(3.0)),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            userModel.profileImageUrl),
                        fit: BoxFit.fill)),
              ),
              Padding(padding: const EdgeInsets.only(left: 8.0)),
              Text(
                userModel.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Proxima Nova'),
              ),
              Spacer(),
              Icon(Icons.more_vert)
            ],
          ),
          Padding(padding: const EdgeInsets.all(3.0)),
          GetBuilder<InstaPostController>(
            builder: (_) {
              return GestureDetector(
                onDoubleTap: () {
                  tapped == true ? tapped = false : tapped = true;
                  print(tapped);
                  instaPostController.onDoubleTap();
                },
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              postModel.postImageUrl),
                          fit: BoxFit.cover)),
                ),
              );
            },
          ),
          Padding(padding: const EdgeInsets.all(5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GetBuilder<InstaPostController>(
                builder: (_) {
                  return GestureDetector(
                      onTap: () {
                        tapped == true ? tapped = false : tapped = true;
                        print(tapped);
                        instaPostController.onDoubleTap();
                      },
                      child: Icon(tapped
                          ? Icons.favorite
                          : Icons.favorite_border_outlined));
                },
              ),
              Icon(Icons.comment_rounded),
              Icon(Icons.send_outlined)
            ],
          )
        ],
      ),
    );
  }
}
