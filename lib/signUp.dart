import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272D4D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
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
                    // initialValue: widget.email,
                    readOnly: true,
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
              padding: const EdgeInsets.only(top: 25.0),
              child: Text('I accept the T&C and PP. '),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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

// Future<LoginModel> loginFunc(String email, String pass) async {
//
//   var requestURL = Uri.parse('https://dev.finance.slate.ac/slate-api/routes.php?action=login');
//   var map = Map<String, dynamic>();
//   map['user_id'] = email;
//   map['password'] = pass;
//   map['source'] = 'APP';
//
//   final response = await http.post(requestURL, body: json.encode(map));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     print(data.toString());
//     var retData = data['ret']['data'];
//     if(retData == ''){
//       return LoginModel();
//     }else{
//       return LoginModel.fromJson(data);
//     }
//     // print('${data['ret']['data']}');
//   } else {
//     return LoginModel.fromJson(data);
//   }
// }