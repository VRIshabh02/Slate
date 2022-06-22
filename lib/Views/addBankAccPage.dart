import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/addBankAccModel.dart';

class AddBankAccount extends StatelessWidget {
   AddBankAccount({Key? key}) : super(key: key);


  TextEditingController bNameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E2E2),
      appBar: AppBar(
          title: Text("Add Bank Account"),
          toolbarHeight: 60,
          backgroundColor: Color(0xFF272D4D),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              )
          )
      ),
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
                        controller: bNameController,
                        decoration: InputDecoration(
                          labelText: 'Benificiary',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: numberController,
                        decoration: InputDecoration(
                          labelText: 'Account Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: ifscController,
                        decoration: InputDecoration(
                          labelText: 'IFSC Code',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: bankNameController,
                        decoration: InputDecoration(
                          labelText: 'Bank Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: branchController,
                        decoration: InputDecoration(
                          labelText: 'Branch Name',
                        ),
                      ),
                    ),

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
                          addBankAccApi(Get.arguments[1],
                              numberController.text,
                              ifscController.text,
                              bankNameController.text,
                              branchController.text,
                              bNameController.text
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
                              child: Text('Add',
                                style: GoogleFonts.roboto(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
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

Future<AddBankAccModel> addBankAccApi(int orgId,
    String accno, String ifsc, String bankName, String branch,String accountName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse(
      'https://uat.finance.slate.ac/slate-api/routes.php?action=createUpdateBankInfo');

  var map = Map<String, dynamic>();
  map['orgId'] = orgId;
  map['accno'] = accno;
  map['ifsc'] = ifsc;
  map['bankName'] = bankName;
  map['branch'] = branch;
  map['accountName'] = accountName;


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
    return AddBankAccModel.fromJson(data);
  } else {
    return AddBankAccModel.fromJson(data);
  }
}