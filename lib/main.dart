import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_slate/Views/calender.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/login.dart';
import 'package:untitled_slate/Views/signUpComplete.dart';
import 'package:untitled_slate/Views/splash.dart';
import 'Views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:  SplashScreen(),
        home: SplashScreen(),
    );
  }
}

