import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/first_page.dart';
import 'package:sakhi_app/home_page.dart';
import 'package:sakhi_app/login_page.dart';
import 'package:sakhi_app/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sakhi_app/signup_page.dart';
import 'package:sakhi_app/uihelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showLogo = false;
      });
    });
    checkUserAuthentication();
  }

  void checkUserAuthentication() async {
    // Replace this logic with your actual authentication check
    // For example, check a shared preference, a token, etc.
    bool isUserLoggedIn = await Future.delayed(Duration(seconds: 2), () {
      return false; // Placeholder, assuming the user is not logged in
    });

    if (isUserLoggedIn) {
      // Navigate to the appropriate page for logged-in users
    } else {
      // Navigate to the sign-up page for users not logged in


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Color
          Container(
            color: Color.fromRGBO(255, 221, 230, 1.0),
          ),
          // Animated Logo
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            top: _showLogo ? 300 : 200,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/sakhi_cropped_circle.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Start Button
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            bottom: _showLogo ? -100 : 200,
            left: 0,
            right: 0,
            child : Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child:   CustomButton(() {
                  mainAxisAlignment: MainAxisAlignment.center;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                }, 'Start'),
              ),
            ),
    )

        ],
      ),
    );
  }
}

Widget CustomButton(VoidCallback voidCallback, String text) {
  return SizedBox(
    height: 50,
    width: 300,
    child: ElevatedButton(
      onPressed: () {
        voidCallback();
      }, style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    )),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    ),
  );
}



