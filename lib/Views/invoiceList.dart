import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/InvoiceListModel.dart';
import 'package:untitled_slate/Views/invoicesListDead.dart';

import 'login.dart';

class InvoiceList extends StatefulWidget {
   InvoiceList({Key? key}) : super(key: key);

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  bool searching = false;
  TextEditingController searchController = TextEditingController();
  List<DataInvoiceList> _list = [];
  List<DataInvoiceList> _filteredList = [];
  final oCcy = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    // change it to get decimal places
    symbol: '₹',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 220,
                child: Text(
                  'Invoices',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
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
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Alert'),
                          content: Text("Are you sure you want to sign out?"),
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
                                      await SharedPreferences.getInstance();
                                  prefs.remove('userData');
                                  Get.offAll(LoginScreen());
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.deepPurple),
                                ))
                          ],
                          actionsAlignment: MainAxisAlignment.spaceBetween,
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
      body: FutureBuilder(
          future: getInvoiceList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              InvoiceListModel invoiceListData =
              snapshot.data as InvoiceListModel;
              _list = invoiceListData.ret.data;
              return SingleChildScrollView(
                child: StatefulBuilder(
                  builder: (context, setWidgetState) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 10.0, bottom: 0, right: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          width: 2,
                                          color: Colors.grey)
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.search),
                                      Container(
                                        width: MediaQuery.of(context).size.width*2.7/5,
                                        child: TextField(
                                          // initialValue: "${widget.email}",
                                            readOnly: false,
                                            controller: searchController,
                                            cursorColor: Colors.black,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration.collapsed(
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                              hintText: 'Search',
                                            ),
                                            onChanged: (text){
                                              _filteredList.clear();
                                              if (text.isEmpty) {
                                                setWidgetState(() {});
                                                return;
                                              }

                                              _list.forEach((userDetail) {
                                                if ((userDetail.invNumber ?? "").contains(searchController.text) || userDetail.customerName.contains(searchController.text)) {
                                                  _filteredList.add(userDetail);
                                                }
                                              });
                                              searching = _filteredList.length < _list.length ? true : false ;
                                              // print(searching);
                                              // print(" Length Length cjbdcvbjbv c           ${_filteredList.length}");
                                              setWidgetState((){
                                              });
                                            }

                                          // onSearchTextChanged(setWidgetState),

                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          icon: Icon(Icons.cancel), onPressed: () {
                                          setWidgetState(() {
                                            searching = false;
                                          });
                                          searchController.clear();
                                          onSearchTextChanged(setWidgetState);
                                        },),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                    child: Image.asset('assets/images/searchFilter.png', height: 25,)
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                                  child:
                                  GridView.count(
                                    childAspectRatio: 7 / 3,
                                    mainAxisSpacing: 10,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 1,
                                    children: listChildren(searching == true
                                        ? _filteredList
                                        : _list),
                                  )
                              ),
                        )
                      ],
                    );
                  }
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
          }),
    );
  }
  List<Widget> listChildren(List<DataInvoiceList> list){
    final children = <Widget>[];
    for(int i =0; i < list.length; i++){
      String date1 = list[i].invDate;
      String status1 = list[i].status;
      children.add(
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${list[i].invNumber}',
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
                              '${list[i].customerName}',
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
                              decoration: BoxDecoration(
                                color:
                                list[i].status == 'NEW' ?
                                Colors.blue:
                                list[i].status == 'DRAFT' ?
                                    Colors.yellow:
                                list[i].status == 'CANCEL' ?
                                    Colors.red :
                                        Colors.white,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0, right: 4, top: 2,bottom: 2),
                                child: Text(
                                  list[i].status == 'NEW' ?
                                      'Issued':
                                  list[i].status == 'CANCEL' ?
                                      'Cancelled' :
                                  "${status1[0].toUpperCase()}${status1.substring(1).toLowerCase()}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                                child: Image.asset('assets/images/dots.png',
                                  height: 20,color: Colors.grey
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${date1.substring(2)}',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
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
                              list[i].invoiceValue != null ?
                              // list[i].invoiceValue is double ?
                              //     oCcy.format(double.parse(list[i].invoiceValue.toString()).abs())
                              // :
                              // oCcy.format(int.parse(list[i].invoiceValue.toString()).abs())
                              'INR ${list[i].invoiceValue}'
                              : ''
                              ,
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
                            ),                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
    return children;
  }

  onSearchTextChanged(Function setWidgetState) async {
    _filteredList.clear();
    if (searchController.text.isEmpty) {
      setWidgetState(() {});
      return;
    }

    _list.forEach((userDetail) {
      if ((userDetail.invNumber ?? "").contains(searchController.text) || userDetail.customerName.contains(searchController.text))
        _filteredList.add(userDetail);
    });
    searching = _filteredList.length < _list.length ? true : false ;
    print(searching);
    print(" Length Length cjbdcvbjbv c           ${_filteredList.length}");
    setWidgetState((){
    });

  }
}


Future<InvoiceListModel> getInvoiceList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data1 = prefs.getString('userData');
  final userData = json.decode(data1!);

  var requestURL = Uri.parse(
      'https://uat.finance.slate.ac/slate-api/routes.php?');

  final uri = Uri.parse('$requestURL').replace(queryParameters: {
    'action': 'getInvoice',
    'arg': '81',
  });
  // print('final url is: $uri');
  // var map = Map<String, dynamic>();
  // map['company_id'] = '$comId';
  // map['from_date'] = '2021-05-01';
  // map['to_date'] = '2021-10-30';
  final response = await http.get(uri,
    headers: {"Authorization": "Bearer${userData['ret']['data']['token']}"},
    // body: json.encode(map)
  );
  var data = jsonDecode(response.body.toString());
  // print('${data.toString()}');
  print('Status code: ${response.statusCode}');
  if (response.statusCode == 200) {
    return InvoiceListModel.fromJson(data);
  } else {
    return InvoiceListModel.fromJson(data);
  }
}