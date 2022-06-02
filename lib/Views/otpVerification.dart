import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/invoicesListDead.dart';

class OtpVerification extends StatefulWidget {
   OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  var otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF272D4D),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF272D4D),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      ImageSlideshow(
                        width: double.infinity,
                        height: 300,
                        initialPage: 0,
                        indicatorColor: Colors.white,
                        indicatorBackgroundColor: Color(0xFF00DFB0),
                        children: [
                          Container(
                            height: 100,
                            child: Image.asset(
                              'assets/images/slateCrousel1.png',
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Image.asset(
                            'assets/images/slateCrousel2.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/slateCrousel3.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                        onPageChanged: (value) {
                          // print('Page changed: $value');
                          // controller.jumpToPage(value);
                        },
                        autoPlayInterval: 3500,
                        isLoop: true,
                      ),
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  //   child:
                  // Image.asset('assets/images/logo.png'),
                ),
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height*2/3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mobile Verification',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff272d4d),
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OtpTextField(

                        numberOfFields: 5,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },

                        //runs when every textfield is filled
                        onSubmit: (String verificationCode){
                          // showDialog(
                          //     context: context,
                          //     builder: (context){
                          //       return
                          //
                          //         AlertDialog(
                          //         title: Text("Verification Code"),
                          //         content: Text('Code entered is $verificationCode'),
                          //       );
                          //     }
                          // );
                          otp = verificationCode;
                        }, // end onSubmit
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8, right: 8.0),
                      child: Text(
                        'Resend OTP',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          print(otp);
                          verifyOTPFunc(otp.toString(), Get.arguments[0]);
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xFF272D4D),
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Center(
                              child:
                              Text('Verify',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
        ));
  }
}

Future verifyOTPFunc(String otp, String number) async {

  var requestURL = Uri.parse('https://dev.finance.slate.ac/slate-api/routes.php?action=verifyEnteredOtp');
  var map = Map<String, dynamic>();

  map['otp'] = "$otp";
  map['phone'] = "$number";

  final response = await http.post(requestURL, body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    print('${data.toString()}');
    var retData = data['ret']['data'];
    if(retData == ''){
      Get.snackbar('Error', '${data['err']['data']}');
    }else{
      Get.snackbar('OTP Verified','');
      Get.offAll(()=> HomePage2(), arguments: [0]);
    }
  } else {
    Get.snackbar('Error', '${data['err']['data']}');
  }
}