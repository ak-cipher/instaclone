import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Services/camera.dart';

import '../models/user_model.dart';

class SelfStoryWidget extends StatelessWidget {
  final UserModel userModel;
  const SelfStoryWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CameraImageService().pickImageFromCamera(),
      child: Container(
            margin: const EdgeInsets.all(5),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: CachedNetworkImageProvider( userModel.profileImageUrl), fit: BoxFit.fill)),
            child: Align(alignment: Alignment.bottomRight,
            child: Icon(Icons.add_circle),),
          ),
    );
  }
}