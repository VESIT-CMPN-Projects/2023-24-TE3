import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhi_app/Messages.dart';
import 'package:sakhi_app/chatbot_ui.dart';
import 'package:sakhi_app/doctor_info.dart';
import 'package:sakhi_app/faqs.dart';
import 'package:sakhi_app/home_page.dart';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:sakhi_app/query_bot.dart';
import 'package:sakhi_app/splash_screen.dart';
import 'package:sakhi_app/login_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,         
      ),
      debugShowCheckedModeBanner: false,
      home : SplashScreen(),
    );
  }
}










