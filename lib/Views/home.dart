import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/companyIDModel.dart';
import 'package:untitled_slate/Models/dashboardCardsModel.dart';
import 'package:untitled_slate/Views/login.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import '../Models/organizationsListByUserId.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int company = Get.arguments[0];
    print('$company');
    return Stack(children: [
      FutureBuilder(
          future: organizationListApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              OrganizationsListByUserId organizationsData =
                  snapshot.data as OrganizationsListByUserId;
              return FutureBuilder(
                  future: companyIdApi(int.parse(
                      organizationsData.ret!.data![company].orgId.toString())),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      CompanyIdModel companyIdData =
                          snapshot.data as CompanyIdModel;
                      return Scaffold(
                        appBar: AppBar(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 220,
                                  child: Text(
                                      '${organizationsData.ret!.data![company].orgName}',
                                  overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Refreshed on ',
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        '${organizationsData.ret!.data![company].updatedOn}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ))),
                            ],
                            toolbarHeight: 60,
                            backgroundColor: Color(0xFF272D4D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)))),
                        drawer: SafeArea(
                          child: Drawer(
                            child: Column(
                              children: [
                                Text("Hello"),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                "Are you sure you want to sign out?"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text("No"),
                                              ),
                                              TextButton(
                                                  onPressed: () async {
                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.remove('userData');
                                                    Get.offAll(LoginScreen());
                                                  },
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.deepPurple),
                                                  ))
                                            ],
                                            actionsAlignment:
                                                MainAxisAlignment.spaceBetween,
                                          ),
                                        ),
                                    child: Text('Sign Out',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ))),
                              ],
                            ),
                          ),
                        ),
                        backgroundColor: Color(0xE1FFFFFF),
                        body: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: FutureBuilder(
                                      future: dashboardCardsApi(companyIdData.ret!.data![0].companyId),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          DashboardCardsModel
                                              dashboardCardsData = snapshot.data
                                                  as DashboardCardsModel;
                                          return GridView.count(
                                            childAspectRatio: 7 / 3,
                                            mainAxisSpacing: 0,
                                            crossAxisSpacing: 0,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            padding: EdgeInsets.zero,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 80,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Sales'),
                                                            Icon(
                                                              Icons.info,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                            dashboardCardsData.ret!.data!.sales!.length != 0 ?
                                                            "${dashboardCardsData.ret!.data!.sales![0].amount}"
                                                                : " "

                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 80,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Receivables'),
                                                            Icon(
                                                              Icons.info,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                            dashboardCardsData.ret!.data!.recievable!.length != 0 ?
                                                            "${dashboardCardsData.ret!.data!.recievable![0].balance}"
                                                        : ""
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 80,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Payable'),
                                                            Icon(
                                                              Icons.info,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                            dashboardCardsData.ret!.data!.payable!.length != 0 ?
                                                            "${dashboardCardsData.ret!.data!.payable![0].balance}"
                                                        : ""
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 80,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text('Liquidity'),
                                                            Icon(
                                                              Icons.info,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                            dashboardCardsData.ret!.data!.liquidity!.length != 0 ?
                                                            "${dashboardCardsData.ret!.data!.liquidity![0].balance}"
                                                        : ""
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                        return Material(
                                          child: Center(
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: Center(
                                                child: Column(
                                                  children: const [
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                      color: Colors.black,
                                                    )),
                                                    Text("Please wait!")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),

                                GridView.count(
                                  childAspectRatio: 5 / 4,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  padding: EdgeInsets.zero,
                                  children: [
                                    for (int i = 0; i < 4; i++)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 80,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFBCC2E5),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Color(
                                                              0xFF292D50)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          size: 30,
                                                        ),
                                                      )),
                                                ),
                                                Text(
                                                  'View\n Invoice',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Color(0xff272d4d),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Icon(
                                                        Icons
                                                            .supervisor_account_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Add User',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Divider(
                                              thickness: 1,
                                              endIndent: 50,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Icon(
                                                        Icons.account_balance,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Add Bank Account',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Divider(
                                              thickness: 1,
                                              endIndent: 50,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Icon(
                                                        Icons
                                                            .business_center_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Update Company Profile',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: Divider(
                                              thickness: 1,
                                              endIndent: 50,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Icon(
                                                        Icons.person_outline,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Data Sync',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 8, bottom: 8),
                                    child: Text(
                                      'Blogs',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          color: Color(0xFF474646),
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                // ImageSlideshow(
                                //
                                //
                                //
                                //   width: double.infinity,
                                //   height: 200,
                                //   initialPage: 0,
                                //   indicatorColor: Colors.transparent,
                                //   indicatorBackgroundColor: Colors.transparent,
                                //   children: [
                                //     Image.asset(
                                //       'assets/images/slateCrousel1.png',
                                //
                                //     ),
                                //     Image.asset(
                                //       'assets/images/slateCrousel2.png',
                                //       fit: BoxFit.cover,
                                //     ),
                                //     Image.asset(
                                //       'assets/images/slateCrousel3.png',
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ],
                                //   onPageChanged: (value) {
                                //     // print('Page changed: $value');
                                //     // controller.jumpToPage(value);
                                //   },
                                //   autoPlayInterval: null,
                                //   isLoop: false,
                                // ),

                                SizedBox(
                                  height: 70,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Material(
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Column(
                              children: const [
                                Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                                Text("Please wait!")
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Material(
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Column(
                      children: const [
                        Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                        Text("Please wait!")
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Text(
                        'Home',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.dashboard_outlined,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Text(
                        'Dashboard',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.document_scanner,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Text(
                        'Invoices',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        size: 30,
                        color: Colors.blue,
                      ),
                      Text(
                        'Notifications',
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

Future<DashboardCardsModel> dashboardCardsApi(var companyId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse(
      'https://uat.finance.slate.ac/slate-api/routes.php?action=dashboardCards');
  var map = Map<String, dynamic>();
  map['company_id'] = '$companyId';
  map['from_date'] = '2021-05-01';
  map['to_date'] = '2021-10-30';
  final response = await http.post(requestURL,
      headers: {"Authorization": "Bearer${userData['ret']['data']['token']}"},
      body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  // print('${data.toString()}');
  if (response.statusCode == 200) {
    return DashboardCardsModel.fromJson(data);
  } else {
    return DashboardCardsModel.fromJson(data);
  }
}

Future<CompanyIdModel> companyIdApi(int orgId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse(
      'https://uat.finance.slate.ac/slate-api/routes.php?action=GetCompanyDetails');
  var map = Map<String, dynamic>();
  map['org_id'] = '$orgId';
  // map['from_date'] = '2021-05-01';
  // map['to_date'] = '2021-10-30';
  final response = await http.post(requestURL,
      headers: {"Authorization": "Bearer${userData['ret']['data']['token']}"},
      body: json.encode(map));
  var data = jsonDecode(response.body.toString());
  // print('${data.toString()}');
  if (response.statusCode == 200) {
    return CompanyIdModel.fromJson(data);
  } else {
    return CompanyIdModel.fromJson(data);
  }
}
