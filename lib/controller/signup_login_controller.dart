import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/Pages/home_screen_page.dart';
import 'package:instagram_clone/Pages/login_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  _intialScreen(User? user) {
    if (user == null) {
      print('Login page');
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void RegisterUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar('About User', 'User message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Account Creation Failed',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void LoginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Login Failed',
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void LogOut() async {
    await auth.signOut();
  }
}
