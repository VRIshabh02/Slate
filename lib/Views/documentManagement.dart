import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/documentManagementModel.dart';
import 'package:untitled_slate/Views/invoicesListDead.dart';
import 'package:untitled_slate/Views/selectCompany.dart';

import '../Controllers/globalVariables.dart';
import '../Models/InvoiceListModel.dart';
import '../Models/organizationsListByUserId.dart';
import 'login.dart';

class DocumentManagement extends StatefulWidget {
  const DocumentManagement({Key? key}) : super(key: key);

  @override
  State<DocumentManagement> createState() => _DocumentManagementState();
}

class _DocumentManagementState extends State<DocumentManagement> {

  var company = Get.arguments[0];
  TextEditingController searchController = TextEditingController();
  bool searching = false;
  List<DataDocument> _list = [];
  List<DataDocument> _filteredList = [];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        company: company,
          company1: company,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 220,
                child: const Text(
                  'Data Management',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
      body: FutureBuilder(
          future: organizationListApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.done) {
              OrganizationsListByUserId
              organizationsData = snapshot.data
              as OrganizationsListByUserId;
              return FutureBuilder(
                  future: getDocuments(organizationsData.ret.data[company].orgId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      DocumentManagementModel documentListData =
                      snapshot.data as DocumentManagementModel;
                      _list = documentListData.ret!.data!;
                      return SingleChildScrollView(
                        child: StatefulBuilder(
                            builder: (context, setWidgetState) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8,
                                        left: 10.0,
                                        bottom: 0,
                                        right: 10),
                                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 12.0, bottom: 12),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 0,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(50),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.grey)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.search),
                                                Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width *
                                                      3 /
                                                      5,
                                                  child: TextField(
// initialValue: "${widget.email}",
                                                      readOnly: false,
                                                      controller: searchController,
                                                      cursorColor: Colors.black,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                      decoration: InputDecoration
                                                          .collapsed(
                                                        hintStyle: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                        hintText: 'Search',
                                                      ),
                                                      onChanged: (text) {
                                                        _filteredList.clear();
                                                        if (text.isEmpty) {
                                                          setWidgetState(() {});
                                                          return;
                                                        }

                                                        _list.forEach((userDetail) {
                                                          if ((userDetail.id.toString() ?? "")
                                                              .contains(
                                                              searchController
                                                                  .text) ||
                                                              userDetail
                                                                  .folderPath!
                                                                  .contains(
                                                                  searchController
                                                                      .text)) {
                                                            _filteredList.add(
                                                                userDetail);
                                                          }
                                                        });
                                                        searching =
                                                        _filteredList.length <
                                                            _list.length
                                                            ? true
                                                            : false;
// print(searching);
// print(" Length Length cjbdcvbjbv c           ${_filteredList.length}");
                                                        setWidgetState(() {});
                                                      }

// onSearchTextChanged(setWidgetState),

                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment
                                                      .centerRight,
                                                  child: IconButton(
                                                    icon: Icon(Icons.cancel),
                                                    onPressed: () {
                                                      setWidgetState(() {
                                                        searching = false;
                                                      });
                                                      searchController.clear();
                                                      onSearchTextChanged(
                                                          setWidgetState);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: GridView.count(
                                          childAspectRatio: 7 / 3,
                                          mainAxisSpacing: 10,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          crossAxisCount: 1,
                                          children: listChildren(
                                              searching == true
                                                  ? _filteredList
                                                  : _list),
                                        )),
                                  )
                                ],
                              );
                            }),
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
            } return Material(
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
          }
      ), setStateDrawer: setState,
    );
  }
  onSearchTextChanged(Function setWidgetState) async {
    _filteredList.clear();
    if (searchController.text.isEmpty) {
      setWidgetState(() {});
      return;
    }

    _list.forEach((userDetail) {
      if ((userDetail.id.toString() ?? "").contains(searchController.text) ||
          userDetail.folderPath!.contains(searchController.text))
        _filteredList.add(userDetail);
    });
    searching = _filteredList.length < _list.length ? true : false;
    // print(searching);
    // print(" Length Length cjbdcvbjbv c           ${_filteredList.length}");
    setWidgetState(() {});
  }

  List<Widget> listChildren(List<DataDocument> list) {
    final children = <Widget>[];
    for (int i = 0; i < list.length; i++) {
      // String date1 =  list[i].id.toString() ?? "";
      children.add(Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // '${list[i].name ?? ""}',
                          "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color(0xff272d4d),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Invoice Number',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          // '${list[i].id ?? ""}',
                          "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Color(0xff272d4d),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Customer Name',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset('assets/images/dots.png',
                                height: 20, color: Colors.grey)
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*date1.length > 2 ?
                        Text(
                          date1.substring(2),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ) :
                        Text(
                          date1,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),*/
                        Text(
                          'Date',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          // list[i].invoiceValue != null
                          //     ?
                          // list[i].invoiceValue is double ?
                          //     oCcy.format(double.parse(list[i].invoiceValue.toString()).abs())
                          // :
                          // oCcy.format(int.parse(list[i].invoiceValue.toString()).abs())
                          // 'INR ${list[i].crcId ?? ""}',
                               '',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Amount',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
    return children;
  }
}


Future<DocumentManagementModel> getDocuments(int orgId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);
  var requestURL = Uri.parse(
      'https://dev.finance.slate.ac/slate-api/routes.php?action=getFolder');

  var map = Map<String, dynamic>();
  map['org_id'] = '81';
  // map['from_date'] = '2021-05-01';
  // map['to_date'] = '2021-10-30';
  final response = await http.post(requestURL,
      headers: {"Authorization": "Bearer${userData['ret']['data']['token']}"},
      body: json.encode(map));
  print(response.body.toString());
  var data = jsonDecode(response.body.toString());
  // print('${data.toString()}');
  if (response.statusCode == 200) {
    return DocumentManagementModel.fromJson(data);
  } else {
    return DocumentManagementModel.fromJson(data);
  }
}