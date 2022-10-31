import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Pages/account_page.dart';
import 'package:instagram_clone/Pages/homepage/insta_post_page.dart';
import 'package:instagram_clone/Pages/notification_page.dart';
import 'package:instagram_clone/Pages/search_barPage.dart';
import 'package:instagram_clone/Pages/video_page.dart';

import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('Users');
  List<UserModel>? userDetailsList;
  StreamSubscription<QuerySnapshot>? userSubscription;

  final topbar = AppBar(
    backgroundColor: Colors.white,
    title: Text(
      "InstaClone",
      style: TextStyle(color: Colors.black, fontFamily: 'Blue vinyl'),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.send),
        color: Colors.black,
      )
    ],
  );

  GetUserDetailsList() {
    userSubscription =
        userCollectionReference.snapshots().listen((userSnapshotData) {
      setState(() {
        userDetailsList = userSnapshotData.docs
            .map((singleUserData) => UserModel.fromJson(singleUserData))
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    GetUserDetailsList();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topbar,
      body: TabBarView(
        controller: tabController,
        children: [
          InstaPostViewWidget(),
          SearchBar(),
          VideoPage(),
          NotificationPage(),
          
          AccountView(
            user: userDetailsList![0],
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            controller: tabController,
            labelPadding: EdgeInsets.all(10.0),
            tabs: [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
              Icon(
                Icons.add_sharp,
                color: Colors.black,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              Icon(
                Icons.account_box,
                color: Colors.black,
              ),
            ]),
      ),
    );
  }
}
