import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Views/invoicesListDead.dart';

import '../Models/DateFormatModel.dart';
import '../Models/companyIDModel.dart';
import '../Models/organizationsListByUserId.dart';
import '../Views/home.dart';
import '../Views/login.dart';
import '../Views/selectCompany.dart';

var userDataGlobal;


class MyScaffold extends StatefulWidget {

  final Widget body;
  final Widget title;
  var company;
  var company1;
  Function setStateDrawer;

  MyScaffold({required this.body, required this.title, required this.company, required this.setStateDrawer, required this.company1});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  widget.title,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF272D4D),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)))),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 20.0, left: 20),
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: organizationListApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.done) {
                      OrganizationsListByUserId
                      organizationsData = snapshot.data
                      as OrganizationsListByUserId;
                      return Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              // Get.dialog(Container(
                              //     width: MediaQuery.of(context)
                              //         .size
                              //         .width *
                              //         4 /
                              //         5,
                              //     child: Column(
                              //       children: [
                              //         Material(
                              //           child: Container(
                              //             height: 40,
                              //             width:
                              //             MediaQuery.of(context)
                              //                 .size
                              //                 .width *
                              //                 4 /
                              //                 5,
                              //             color: Colors.teal,
                              //             child: Padding(
                              //               padding:
                              //               const EdgeInsets.all(
                              //                   8.0),
                              //               child: Text(
                              //                 'Select Company',
                              //                 style:
                              //                 GoogleFonts.poppins(
                              //                     fontSize: 13,
                              //                     color: Colors
                              //                         .white,
                              //                     fontWeight:
                              //                     FontWeight
                              //                         .w400),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         Material(
                              //           child: Container(
                              //             width:
                              //             MediaQuery.of(context)
                              //                 .size
                              //                 .width *
                              //                 4 /
                              //                 5,
                              //             height:
                              //             MediaQuery.of(context)
                              //                 .size
                              //                 .height *
                              //                 4 /
                              //                 5,
                              //             color: Colors.white,
                              //             child: FutureBuilder(
                              //                 future:
                              //                 organizationListApi(),
                              //                 builder: (context,
                              //                     snapshot) {
                              //                   if (snapshot
                              //                       .connectionState ==
                              //                       ConnectionState
                              //                           .done) {
                              //                     OrganizationsListByUserId
                              //                     organizationsData =
                              //                     snapshot.data
                              //                     as OrganizationsListByUserId;
                              //                     return SingleChildScrollView(
                              //                       child: Column(
                              //                         children: [
                              //                           SizedBox(
                              //                             height: 10,
                              //                           ),
                              //                           for (int i =
                              //                           0;
                              //                           i <
                              //                               organizationsData
                              //                                   .ret
                              //                                   .data
                              //                                   .length;
                              //                           i++)
                              //                             Container(
                              //                               child:
                              //                               Column(
                              //                                 mainAxisAlignment:
                              //                                 MainAxisAlignment.start,
                              //                                 crossAxisAlignment:
                              //                                 CrossAxisAlignment.start,
                              //                                 children: [
                              //                                   SizedBox(
                              //                                     height:
                              //                                     0,
                              //                                   ),
                              //                                   GestureDetector(
                              //                                     onTap:
                              //                                         () {
                              //                                       // setState(() {
                              //                                       //   clicked = !clicked;
                              //                                       // });
                              //                                       // Get.off(()=> HomePage2(), arguments: [i]);
                              //                                       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage2()));
                              //                                       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              //                                       //     HomePage2()), (Route<dynamic> route) => false);
                              //                                           widget.setStateDrawer(() {
                              //                                         // widget.company = i;
                              //                                             widget.comapny1 = i;
                              //                                         print(widget.company);
                              //                                         // setIt();
                              //                                       });
                              //                                           setState(() {
                              //                                             // widget.company = i;
                              //                                             widget.comapny1 = i;
                              //                                             print(widget.company);
                              //                                           });
                              //                                       Get.back();
                              //                                     },
                              //                                     child:
                              //                                     Container(
                              //                                       child: Row(
                              //                                         mainAxisAlignment: MainAxisAlignment.start,
                              //                                         children: [
                              //                                           Padding(
                              //                                             padding: const EdgeInsets.all(8.0),
                              //                                             child: Container(
                              //                                               height: 25,
                              //                                               width: 25,
                              //                                               decoration: BoxDecoration(
                              //                                                   color:
                              //                                                   // clicked1 == true ? Colors.teal :
                              //                                                   Colors.white,
                              //                                                   border: Border.all(
                              //                                                       color: Colors.teal
                              //                                                   ),
                              //                                                   borderRadius: BorderRadius.circular(50)),
                              //                                               child: Icon(
                              //                                                 Icons.done,
                              //                                                 color: Colors.white,
                              //                                               ),
                              //                                             ),
                              //                                           ),
                              //                                           Padding(
                              //                                             padding: const EdgeInsets.all(8.0),
                              //                                             child: Column(
                              //                                               crossAxisAlignment: CrossAxisAlignment.start,
                              //                                               children: [
                              //                                                 Text(
                              //                                                   '${organizationsData.ret.data[i].orgName}',
                              //                                                   style: GoogleFonts.poppins(
                              //                                                       fontSize: 15,
                              //                                                       color: Colors.black,
                              //                                                       fontWeight: FontWeight.bold
                              //                                                   ),
                              //                                                 ),
                              //                                                 Row(
                              //                                                   children: [
                              //                                                     Text(
                              //                                                       'primary contact: ',
                              //                                                       style: GoogleFonts.poppins(fontSize: 10,
                              //                                                           color: Colors.black,
                              //                                                           fontWeight: FontWeight.w600
                              //                                                       ),
                              //                                                     ),
                              //                                                     SizedBox(
                              //                                                       width: 5,
                              //                                                     ),
                              //                                                     Text(
                              //                                                       '${organizationsData.ret.data[i].primaryContact}',
                              //                                                       style: GoogleFonts.poppins(
                              //                                                           fontSize: 15,
                              //                                                           color: Colors.black,
                              //                                                           fontWeight: FontWeight.bold
                              //                                                       ),
                              //                                                     ),
                              //                                                   ],
                              //                                                 )
                              //                                               ],
                              //                                             ),
                              //                                           ),
                              //                                         ],
                              //                                       ),
                              //                                     ),
                              //                                   ),
                              //                                   SizedBox(
                              //                                     height:
                              //                                     20,
                              //                                   ),
                              //                                 ],
                              //                               ),
                              //                             ),
                              //                         ],
                              //                       ),
                              //                     );
                              //                   }
                              //                   return const Center(
                              //                       child:
                              //                       CircularProgressIndicator(
                              //                         color: Colors.white,
                              //                         // ));
                              //                       ));
                              //                 }),
                              //           ),
                              //         )
                              //       ],
                              //     )));
                            },
                            child: Container(
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        top: 15.0),
                                    child: CircleAvatar(
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(50),
                                          child: Image.asset(
                                              'assets/images/customerLogo.png')),
                                      radius: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(
                                        8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(children: [
                                          Text(
                                            organizationsData.ret.data[widget.company].orgName,
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                color: Colors
                                                    .black,
                                                decoration:
                                                TextDecoration
                                                    .none,
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          ),
                                          // Icon(Icons
                                          //     .arrow_drop_down),
                                        ]),
                                        Row(children: [
                                          Text(
                                            'Refreshed on: ',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors
                                                    .black45,
                                                decoration:
                                                TextDecoration
                                                    .none,
                                                fontWeight:
                                                FontWeight
                                                    .w500),
                                          ),
                                          Text(
                                            organizationsData.ret.data[widget.company].updatedOn.split(' ')[0],
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors
                                                    .black,
                                                decoration:
                                                TextDecoration
                                                    .none,
                                                fontWeight:
                                                FontWeight
                                                    .w500),
                                          ),
                                        ]),
                                        Text(
                                          '${userDataGlobal['ret']['data']['name']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color:
                                              Colors.black,
                                              decoration:
                                              TextDecoration
                                                  .none,
                                              fontWeight:
                                              FontWeight
                                                  .w500),
                                        ),
                                        Text(
                                          '${userDataGlobal['ret']['data']['last_role_name']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors
                                                  .black45,
                                              decoration:
                                              TextDecoration
                                                  .none,
                                              fontWeight:
                                              FontWeight
                                                  .w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                  Get.offAll(()=> HomePage2(), arguments: [widget.company, 1]);
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.dashboard_outlined,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'DASHBOARD',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration:
                                      TextDecoration.none,
                                      fontWeight:
                                      FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.description_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'REPORTS',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                Get.offAll(()=> HomePage2(), arguments: [widget.company, 2]);
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.description_outlined,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'INVOICES',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration:
                                      TextDecoration.none,
                                      fontWeight:
                                      FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.sync,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'TALLY SYNC',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.dashboard_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'COMPANY PROFILE',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.person_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'CUSTOMERS',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'MARKETPLACE',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.dashboard_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'DOCUMENT MANAGEMENT',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10),
                            child: Row(children: [
                              Icon(
                                Icons.lock_outline,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'RESET PASSWORD',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                    decoration:
                                    TextDecoration.none,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20),
                                color: Colors.teal),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 2.0, right: 2),
                              child: TextButton(
                                  onPressed: () =>
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext
                                        context) =>
                                            AlertDialog(
                                              title:
                                              Text('Alert'),
                                              content: Text(
                                                  "Are you sure you want to sign out?"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child:
                                                  Text("No"),
                                                ),
                                                TextButton(
                                                    onPressed:
                                                        () async {
                                                      SharedPreferences
                                                      prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                      prefs.remove(
                                                          'userData');
                                                      Get.offAll(
                                                          LoginScreen());
                                                    },
                                                    child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .deepPurple),
                                                    ))
                                              ],
                                              actionsAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                            ),
                                      ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons
                                            .power_settings_new,
                                        color: Colors.white,
                                      ),
                                      Text('Logout',
                                          style: GoogleFonts.poppins(
                                              color: Colors
                                                  .white,
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight
                                                  .bold)),
                                    ],
                                  )),
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
          ),
        ),
      ),
      body: widget.body,

    );
  }
}