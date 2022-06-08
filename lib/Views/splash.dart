import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/invoicesListDead.dart';
import 'package:untitled_slate/Views/login.dart';
import 'package:untitled_slate/Views/otpVerification.dart';
import 'package:untitled_slate/Views/signUp.dart';

import 'invoiceList.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<CrossFadeABState> crossFadeAnimation =
  GlobalKey<CrossFadeABState>();

  final GlobalKey<AnimatorWidgetState> basicAnimation =
  GlobalKey<AnimatorWidgetState>();

  final GlobalKey<InOutAnimationState> inOutAnimation5 =
  GlobalKey<InOutAnimationState>();
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272D4D),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 0)),
          InOutAnimation(
              key: inOutAnimation5,
              outDefinition: FadeOutAnimation(

              ),
              inDefinition: SlideInUpAnimation(
                  preferences: AnimationPreferences(duration: Duration(seconds: 3) )
              ),

              child:
              // Replace with the image

              Center(
                child: Container(
                  child: Image.asset('assets/images/splashImage.png', height: 600,),
                ),
              )


            /*Container(
              height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF282E4F)
                ),
              child: Center(child: Text("Slate", style: GoogleFonts.poppins(fontSize:20,
                  color: Colors.white),)),
            )*/

          ),
        ],
      ),
    );
  }
  _navigatetohome()async{
    int i = 0;
    await Future.delayed(Duration(milliseconds: 5000));


    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    if (userData != null) {
      userDataGlobal = json.decode(userData);
      Get.off(HomePage2(), arguments: [i,0]);
    }
    else{
      Get.offAll(LoginScreen());
    }

    // Get.offAll(LoginScreen(), arguments: [0]);


  }
}


