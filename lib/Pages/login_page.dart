import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Pages/signup_page.dart';
import 'package:instagram_clone/controller/signup_login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
                  Icon(Icons.cancel_outlined),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.2,
            ),
            Center(
              child: Text(
                'InstaClone',
                style: TextStyle(fontFamily: 'Blue Vinyl', fontSize: 40),
              ),
            ),
            SizedBox(
              height: h * 0.08,
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
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Text('Forget Password ?'),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: MaterialButton(
                  onPressed: () {
                    AuthController.instance.LoginUser(
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
            SizedBox(
              height: h * 0.07,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Get.offAll(() => SignupPage()),
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[500], fontSize: 15),
                      children: const [
                        TextSpan(
                          text: 'Create',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
