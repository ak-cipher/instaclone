import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenStoryView extends StatefulWidget {
  String url;
  FullScreenStoryView({required this.url});

  @override
  State<FullScreenStoryView> createState() => _FullScreenStoryViewState();
}

class _FullScreenStoryViewState extends State<FullScreenStoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.url,
        child: SizedBox.expand(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: widget.url,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: (() {
                      Navigator.of(context).pop();
                    }),
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
