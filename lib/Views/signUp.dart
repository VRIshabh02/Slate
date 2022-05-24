import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled_slate/Models/signUpModel.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/login.dart';
import 'package:untitled_slate/Views/otpVerification.dart';

class SignUpPage extends StatefulWidget {
  dynamic email;
   SignUpPage( this.email);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController cNameController = TextEditingController();
  TextEditingController cTypeController = TextEditingController();
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272D4D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
        Container(
        // height: 360,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign Up',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color(0xff272d4d),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'Email',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    // initialValue: "${widget.email}",
                    readOnly: false,
                    controller: emailController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '${widget.email}',
                    ),
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'First Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    readOnly: false,
                    controller: fNameController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                    ),
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'Last Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    readOnly: false,
                    controller: lNameController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                    ),
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'Contact Number',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    readOnly: false,
                    controller: numberController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                    ),
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'Company Name',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    readOnly: false,
                    controller: cNameController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                    ),
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                child: Text(
                  'Company Type',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Color(0xff272d4d),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 0, right: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 2,
                          color: Colors.grey)
                  ),
                  child: TextFormField(
                    readOnly: false,
                    controller: cTypeController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                          // print('$ischecked');
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.teal),
                            color: isChecked == true
                                ? Colors.teal
                                : Colors.white),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Text('I accept the T&C and PP. '),
                  isChecked == false
                      ? Icon(
                    Icons.info,
                    size: 15,
                    color: Colors.redAccent,
                  )
                      : Container()
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  isChecked == true ?
                  signUpFunc(
                      emailController.text == ""?
                      widget.email: emailController.text,
                      fNameController.text,
                      cNameController.text,lNameController.text, numberController.text,
                       cTypeController.text).then((value) {
                         value.ret!.data == true ?
                             sendOTPFunc(widget.email, fNameController.text,
                                 cNameController.text,lNameController.text, numberController.text,
                                 cTypeController.text):
                             Get.snackbar('Error', "${value.err!.data}");
                  }) :
                      Get.snackbar('Error', 'Please tick the tc box');
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFF272D4D),
                      borderRadius: BorderRadius.circular(14)
                  ),
                  child: Center(
                    child:
                    Text('Sign Up',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Already have an account?',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Color(0xff272d4d),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Login',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xFF272D4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Need Help?',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFF272D4D),
                  fontWeight: FontWeight.w400),
            ),
            Text('Reach out to us at support@slate.ac',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFF272D4D),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20,),
          ],
        ),
        )
          ],
        ),
      ),
    );
  }
}

Future<SignUpModel> signUpFunc(String email, String fname,String companyName, String lname, String number, String companyType) async {

  var requestURL = Uri.parse('https://uat.finance.slate.ac/slate-api/routes.php?action=formValidationSelfSignup');
  var map = Map<String, dynamic>();
  map['companytype'] = "$companyType";
  map['companyname'] = "$companyName";
  map['address'] = null;
  map['gstin'] = null;
  map['pan'] = null;
  map['country'] = null;
  map['state'] = null;
  map['city'] = null;
  map['pincode'] = null;
  map['referral_code'] = null;
  map['fname'] = "$fname";
  map['lname'] = "$lname";
  map['email'] = "$email";
  map['phone'] = "$number";

  final response = await http.post(requestURL, body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    // print(data.toString());
    var retData = data['ret']['data'];
    if(retData == ''){
      Get.snackbar('Error', '${data['err']['data']}');
      return SignUpModel();
    }else{
      return SignUpModel.fromJson(data);
    }
  } else {
    Get.snackbar('Error', '${data['err']['data']}');
    return SignUpModel.fromJson(data);
  }
}

Future sendOTPFunc(String email, String fname,String companyName, String lname, String number, String companyType) async {

  var requestURL = Uri.parse('https://uat.finance.slate.ac/slate-api/routes.php?action=sendOtp');
  var map = Map<String, dynamic>();
  map['companytype'] = "$companyType";
  map['companyname'] = "$companyName";
  map['address'] = null;
  map['gstin'] = null;
  map['pan'] = null;
  map['country'] = null;
  map['state'] = null;
  map['city'] = null;
  map['pincode'] = null;
  map['referral_code'] = null;
  map['fname'] = "$fname";
  map['lname'] = "$lname";
  map['email'] = "$email";
  map['phone'] = "$number";

  final response = await http.post(requestURL, body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    var retData = data['ret']['data'];
    if(retData == ''){
      Get.snackbar('Error', '${data['err']['data']}');
    }else{
      Get.snackbar('OTP Sent','');
      Get.to(()=> OtpVerification(), arguments: [number]);
    }
  } else {
    Get.snackbar('Error', '${data['err']['data']}');
  }
}