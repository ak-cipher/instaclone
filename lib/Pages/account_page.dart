import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class AccountView extends StatefulWidget {
  final UserModel user;
  const AccountView({super.key, required this.user});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 15.0, 0),
                child: Icon(Icons.view_headline),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.user.profileImageUrl),
                      fit: BoxFit.fill)),
            ),
            Column(
              children: const [
                Text(
                  '4',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Followers',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Following',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(),
                elevation: 5.0,
                color: Colors.grey[200],
                child: Container(
                  height: 35,
                  child: const Center(
                    child: Text(
                      'Edit profile',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(),
              elevation: 5.0,
              color: Colors.grey[200],
              child: Container(
                height: 35,
                width: 40,
                child: const Center(
                  child: Icon(Icons.person_add),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
