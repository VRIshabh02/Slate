import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/organizationsListByUserId.dart';
import 'package:untitled_slate/Views/home.dart';

class SelectCompany extends StatefulWidget {
  const SelectCompany({Key? key}) : super(key: key);

  @override
  State<SelectCompany> createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Select Company',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xff272d4d),
                fontWeight: FontWeight.bold),
          ),
        )
      ),
      body: FutureBuilder(
        future: organizationListApi(),
        builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      OrganizationsListByUserId organizationsData = snapshot
          .data as OrganizationsListByUserId;
      return
        Column(
          children: [
            for(int i = 0; i < organizationsData.ret!.data!.length; i++)
            Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   clicked = !clicked;
                    // });
                    Get.off(()=> HomePage(), arguments: [i]);
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color:
                                clicked == true ?
                                Colors.teal : Colors.white,
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.done, color: Colors.white,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${organizationsData.ret!.data![i].orgName}',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text('primary contact: ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Name',
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
      ),
            ),
          ],
        );
    }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          // ));
              ));
        }
      ),
    );
  }
}



Future<OrganizationsListByUserId> organizationListApi() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse('https://uat.finance.slate.ac/slate-api/routes.php?action=getAllOrgByUserId');
  // var map = Map<String, dynamic>();
  // map['user_id'] = email;
  // map['password'] = pass;
  // map['source'] = 'APP';
  final response = await http.get(requestURL,
      headers: {"Authorization":"Bearer${userData['ret']['data']['token']}"}
      // body: json.encode(map)
  );
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
      return OrganizationsListByUserId.fromJson(data);
  } else {
    return OrganizationsListByUserId.fromJson(data);
  }
}
