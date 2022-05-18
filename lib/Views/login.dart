import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/emailVerification.dart';
import 'package:untitled_slate/Models/loginModel.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import 'package:untitled_slate/Views/signUp.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ischecked= false;
  bool ischeckedError = false;
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF272D4D),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xFF272D4D),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                          children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
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
                        ImageSlideshow(
                          width: double.infinity,
                          height: 300,
                          initialPage: 0,
                          indicatorColor: Colors.white,
                          indicatorBackgroundColor: Color(0xFF00DFB0),
                          children: [
                            Image.asset(
                              'assets/images/slateCrousel1.png',
                              fit: BoxFit.cover,
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
                Container(
                  // height: 360,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        login == false ?
                        Text(
                          'Login or Sign Up',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff272d4d),
                              fontWeight: FontWeight.bold),
                        ):
                        Text(
                          'Login',
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
                            controller: emailController,
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
                      login == true ?
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 30, right: 8.0),
                          child: Text(
                            'Password',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Color(0xff272d4d),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ): Container(),
                      login == true ?
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 20, right: 20),
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
                              controller: passwordController,
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
                      ):
                          Container(),

                      login == true ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // StatefulBuilder(
                              //   builder: (context, setstate1) {
                              //     return GestureDetector(
                              //         onTap: (){
                              //           setState(() {
                              //
                              //           ischecked = !ischecked;
                              //             print('$ischecked');
                              //           });
                              //         },
                              //         child: CheckBox());
                              //   }
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      ischecked = !ischecked;
                                      // print('$ischecked');
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      color:
                                      ischecked == true ?
                                      Colors.teal : Colors.white
                                    ),
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(Icons.done, color: Colors.white,),
                                    )),
                                  ),
                                ),
                              ),
                              Text('I accept the T&C and PP. '),
                              ischecked == false ?
                              Icon(
                                Icons.info,
                                size: 15,
                                color: Colors.redAccent,
                              ): Container()
                            ],
                          ):
                          Container(),

                      login == false ?
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                        child: GestureDetector(
                          onTap: ()async{
                            emailVerification(emailController.text).then((value){
                              if(value.err?.msg == 'username exist'){
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => const HomePage() ));
                                setState(() {
                                  login = true;
                                });
                              }else if(value.ret?.msg == 'data not found'){
                                Navigator.push(context,MaterialPageRoute(builder: (context) =>  SignUpPage(emailController.text) ));
                              }
                            });
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

                              Text('Continue',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ),
                          ),
                        ),
                      ):
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                        child: GestureDetector(
                          onTap: (){
                            loginFunc(emailController.text, passwordController.text).then((value) async {
                              if(value.ret?.status == 1 && ischecked == true){
                                Get.snackbar('LogIn Successful', '');
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage()));
                                Get.off(()=> SelectCompany());
                              }
                              else {
                                Get.snackbar('Error', 'Invalid Credentials, or check your connection');
                                SharedPreferences prefs =
                                     await SharedPreferences
                                    .getInstance();
                                prefs.remove('userData');
                                // Get.offAll(LoginScreen());
                                setState(() {
                                  ischeckedError = true;
                                });
                              }
                              // else{
                              //   Get.snackbar('Error', 'Something went wrong, please try again later.');
                              // }
                            });
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
                                Text('Login',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                            ),
                          ),
                        ),
                      ),
                      login == false ?
                      Row(
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Login',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Color(0xFF272D4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ):
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Forgot Password?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0xFF272D4D),
                              fontWeight: FontWeight.bold),
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
          )),
    );
  }
}

Future<EmailVerification> emailVerification(String email) async {

  var requestURL = Uri.parse('https://dev.finance.slate.ac/slate-api/routes.php?action=userNameValidation');
  var map = Map<String, dynamic>();
  map['email'] = email;

  final response = await http.post(requestURL, body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return EmailVerification.fromJson(data);
  } else {
    return EmailVerification.fromJson(data);
  }
}


Future<LoginModel> loginFunc(String email, String pass) async {

  var requestURL = Uri.parse('https://dev.finance.slate.ac/slate-api/routes.php?action=login');
  var map = Map<String, dynamic>();
  map['user_id'] = email;
  map['password'] = pass;
  map['source'] = 'APP';

  final response = await http.post(requestURL, body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    var retData = data['ret']['data'];
    if(retData == ''){
      return LoginModel();
    }else{
      sharedPref(data);
      return LoginModel.fromJson(data);
    }
    // print('${data['ret']['data']}');
  } else {
    return LoginModel.fromJson(data);
  }
}

Future sharedPref(dynamic data) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userData', jsonEncode(data));
  String? userData = prefs.getString('userData');
  // print('Vrishabh ${userData}');
}