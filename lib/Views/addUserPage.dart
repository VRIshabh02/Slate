import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';
import 'package:untitled_slate/Models/addUserModel.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  var company = Get.arguments[0];

  TextEditingController fNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController roleController = TextEditingController();

  bool inviteCheck = false;
  bool subWarningCheck = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.teal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E2E2),
      appBar: AppBar(
          title: Text("Add Company User"),
          toolbarHeight: 60,
          backgroundColor: Color(0xFF272D4D),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: fNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: lNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email ID',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: numberController,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: roleController,
                        decoration: InputDecoration(
                          labelText: 'Select Role',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: inviteCheck,
                            onChanged: (bool? value){
                                  setState(() {
                                    inviteCheck = !inviteCheck;
                                  });
                            },
                        ),
                        Text('Send Email invites to User')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: subWarningCheck,
                          onChanged: (bool? value){
                            setState(() {
                              subWarningCheck = !subWarningCheck;
                            });
                          },
                        ),
                        Expanded(
                          child: Text("You subscrition allows two users. You will be charged for on-boarding new user. "
                              "Click here for details."),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text("Note: New user will be informed that you send\n email invitaion to join accounting platform.",

                    )
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          addUserApi(
                              Get.arguments[1],
                              fNameController.text,
                              lNameController.text,
                              emailController.text,
                              numberController.text,
                              roleController.text,
                              inviteCheck,
                              '3',
                              subWarningCheck
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('Save',
                              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          border: Border.all()
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('Cancel',
                              style: GoogleFonts.roboto(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<AddUserModel> addUserApi(int orgId,
    String fName, String lName, String email, String phone,String roleId, bool sendInvites,
    String dataLength, bool subAllow) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse(
      'https://uat.finance.slate.ac/slate-api/routes.php?action=createUser');

  var map = Map<String, dynamic>();
  map['orgId'] = orgId;
  map['fname'] = fName;
  map['lname'] = lName;
  map['email'] = email;
  map['phone'] = phone;
  map['roleId'] = roleId;
  map['sendInvite'] = sendInvites;
  map['dataLength'] = dataLength;
  map['subscribeallow'] = subAllow;

  final response = await http.post(requestURL,
      headers: {"Authorization": "Bearer${userData['ret']['data']['token']}"},
      body: json.encode(map));
  var data = json.decode(response.body.toString());
  // print('${data.toString()}');
  // print(data['ret']['status']);
  if (response.statusCode == 200) {
    if(data['ret']['status'] == 1) {
      Get.snackbar("User Added", "");
    }else{
      Get.snackbar("${data['err']['data']}", "");
    }
    return AddUserModel.fromJson(data);
  } else {
    return AddUserModel.fromJson(data);
  }
}