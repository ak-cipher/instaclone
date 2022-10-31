import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signup_login_controller.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 10, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                      onTap: () => Get.offAll(() => LoginPage()),
                      child: Icon(Icons.cancel_outlined)),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: Text(
                'InstaClone',
                style: TextStyle(fontFamily: 'Blue Vinyl', fontSize: 40),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5))
                ],
              ),
              child: TextField(
                controller: emailTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5))
                ],
              ),
              child: TextField(
                controller: passwordTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password_rounded),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: MaterialButton(
                  onPressed: () {
                    AuthController.instance.RegisterUser(
                        emailTextController.text.trim(),
                        passwordTextController.text.trim());
                  },
                  child: Container(
                    width: w * 0.5,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Icon(Icons.done),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
