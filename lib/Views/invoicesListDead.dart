import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Models/InvoiceListModel.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import '../Models/DateFormatModel.dart';
import '../Models/companyIDModel.dart';
import '../Models/dashboardCardsModel.dart';
import '../Models/organizationsListByUserId.dart';
import 'calender.dart';
import 'invoiceList.dart';
import 'login.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;
  static int company = 2;

  static bool searching = false;
  static TextEditingController searchController = TextEditingController();
  static List<DataInvoiceList> _list = [];
  static List<DataInvoiceList> _filteredList = [];

  static final oCcy = NumberFormat.currency(
    name: "INR",
    locale: 'en_IN',
    // change it to get decimal places
    symbol: '₹',
  );
  static DateTimeRange? myDateRange;
  static late String DateRange1;
  static List<dynamic> splitted = [];
  static void _submitForm() {
    final FormState? form = myFormKey.currentState;
    form!.save();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    StatefulBuilder(builder: (context, setState12) {
      return Stack(children: [
        FutureBuilder(
            future: organizationListApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                OrganizationsListByUserId organizationsData =
                    snapshot.data as OrganizationsListByUserId;
                return FutureBuilder(
                    future: companyIdApi(int.parse(organizationsData
                        .ret!.data![company].orgId
                        .toString())),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        CompanyIdModel companyIdData =
                            snapshot.data as CompanyIdModel;
                        return FutureBuilder(
                            future: dateFormat(companyIdData
                                .ret!.data![0].companyId
                                .toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                DateFormatModel dateFormatData =
                                    snapshot.data as DateFormatModel;
                                return Scaffold(
                                  appBar: AppBar(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  '${organizationsData.ret!.data![company].updatedOn}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.dialog(
                                                  Material(
                                                    child: Form(
                                                      key: myFormKey,
                                                      child: Center(
                                                        child: Column(
                                                          children: [
                                                            SafeArea(
                                                              child:
                                                                  DateRangeField(
                                                                      enabled:
                                                                          true,
                                                                      firstDate: DateTime(
                                                                          int.parse((dateFormatData.ret!.data![0].dYear! - 1)
                                                                              .toString()),
                                                                          int.parse((dateFormatData.ret!.data![0].dMonth! + 1)
                                                                              .toString())),
                                                                      lastDate: DateTime(
                                                                          int.parse(dateFormatData.ret!.data![0].dYear
                                                                              .toString()),
                                                                          int.parse(dateFormatData.ret!.data![0].dMonth
                                                                              .toString())),
                                                                      initialValue: DateTimeRange(
                                                                          start: DateTime(
                                                                              int.parse((dateFormatData.ret!.data![0].dYear! - 1).toString()),
                                                                              int.parse((dateFormatData.ret!.data![0].dMonth! + 1).toString())),
                                                                          end: DateTime(int.parse((dateFormatData.ret!.data![0].dYear! - 1).toString()), int.parse((dateFormatData.ret!.data![0].dMonth! + 1).toString())).add(Duration(days: 5))),
                                                                      decoration: InputDecoration(
                                                                        labelText:
                                                                            'Date Range',
                                                                        prefixIcon:
                                                                            Icon(Icons.date_range),
                                                                        hintText:
                                                                            'Please select a start and end date',
                                                                        border:
                                                                            OutlineInputBorder(),
                                                                      ),
                                                                      validator: (value) {
                                                                        if (value!
                                                                            .start
                                                                            .isBefore(DateTime.now())) {
                                                                          return 'Please enter a later start date';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      onSaved: (value) {
                                                                        setState12(
                                                                            () {
                                                                          myDateRange =
                                                                              value!;
                                                                          DateRange1 =
                                                                              myDateRange.toString();
                                                                          splitted =
                                                                              DateRange1.split(' ');
                                                                          print(
                                                                              '${splitted}');
                                                                          print(
                                                                              '${splitted[0]} to ${splitted[3]}');
                                                                        });
                                                                      }),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                _submitForm();
                                                                Get.back();
                                                                setState12(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                height: 30,
                                                                width: 200,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .deepPurple,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                child: Center(
                                                                    child: Text(
                                                                  "Done",
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  )),
                                            )),
                                      ],
                                      toolbarHeight: 60,
                                      backgroundColor: Color(0xFF272D4D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                              bottomLeft:
                                                  Radius.circular(20)))),
                                  drawer: SafeArea(
                                    child: Drawer(
                                      child: Column(
                                        children: [
                                          Text("Hello"),
                                          TextButton(
                                              onPressed: () =>
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
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
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: FutureBuilder(
                                                future: dashboardCardsApi(
                                                    companyIdData.ret!.data![0]
                                                        .companyId,
                                                    splitted.length == 0
                                                        ? '2021-05-01'
                                                        : splitted[0],
                                                    splitted.length == 0
                                                        ? '2021-10-30'
                                                        : splitted[3]),
                                                builder: (context, snapshot) {
                                                  print(
                                                      "yaha dekho ${splitted}");

                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    DashboardCardsModel
                                                        dashboardCardsData =
                                                        snapshot.data
                                                            as DashboardCardsModel;
                                                    // print(
                                                    //     "sales ka value ${dashboardCardsData.ret!.data!.sales![0].amount}");
                                                    print(
                                                        "snapshot data : ${snapshot.data}");
                                                    return Container(
                                                      child: GridView.count(
                                                        childAspectRatio: 7 / 3,
                                                        mainAxisSpacing: 0,
                                                        crossAxisSpacing: 0,
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        crossAxisCount: 2,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 200,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
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
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 4.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                15,
                                                                            width:
                                                                                15,
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(50)),
                                                                            child:
                                                                                Icon(
                                                                              Icons.shopping_bag_outlined,
                                                                              size: 10,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                            'Sales'),
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.grey,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      dashboardCardsData.ret!.data!.sales!.length ==
                                                                              0
                                                                          ?
                                                                          // "${dashboardCardsData.ret!.data!.sales![0].amount}"
                                                                          ' '
                                                                          : "${oCcy.format(dashboardCardsData.ret!.data!.sales![0].amount?.abs())} ",
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 200,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
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
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 4.0),
                                                                          child: Container(
                                                                              height: 15,
                                                                              width: 15,
                                                                              decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(50)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/receivablesLogo.png',
                                                                                  color: Colors.white,
                                                                                ),
                                                                              )),
                                                                        ),
                                                                        Text(
                                                                            'Receivables'),
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.grey,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      dashboardCardsData.ret!.data!.recievable!.length !=
                                                                              0
                                                                          ?
                                                                          // "${dashboardCardsData.ret!.data!.recievable![0].balance}"
                                                                          '${oCcy.format(double.parse(dashboardCardsData.ret!.data!.recievable![0].balance.toString()).abs())}'
                                                                          : "",
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 200,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
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
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 4.0),
                                                                          child: Container(
                                                                              height: 15,
                                                                              width: 15,
                                                                              decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(50)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/payableLogo.png',
                                                                                  color: Colors.white,
                                                                                ),
                                                                              )),
                                                                        ),
                                                                        Text(
                                                                            'Payable'),
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.grey,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      dashboardCardsData.ret!.data!.payable!.length !=
                                                                              0
                                                                          ?
                                                                          // "${dashboardCardsData.ret!.data!.payable![0].balance}"
                                                                          '${oCcy.format(double.parse(dashboardCardsData.ret!.data!.payable![0].balance.toString()).abs())}'
                                                                          : "",
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 200,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
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
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 4.0),
                                                                          child: Container(
                                                                              height: 15,
                                                                              width: 15,
                                                                              decoration: BoxDecoration(color: Colors.tealAccent, borderRadius: BorderRadius.circular(50)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(2.0),
                                                                                child: Image.asset('assets/images/liquidityLogo.png', color: Colors.white),
                                                                              )),
                                                                        ),
                                                                        Text(
                                                                            'Liquidity'),
                                                                        Icon(
                                                                          Icons
                                                                              .info,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Colors.grey,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      dashboardCardsData.ret!.data!.liquidity!.length !=
                                                                              0
                                                                          ?
                                                                          // "${dashboardCardsData.ret!.data!.liquidity![0].balance}"
                                                                          '${oCcy.format(double.parse(dashboardCardsData.ret!.data!.liquidity![0].balance.toString()).abs())}'
                                                                          : "",
                                                                      style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                              Text(
                                                                  "Please wait!")
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
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            padding: EdgeInsets.zero,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => InvoiceList());

                                                  },
                                                  child: Container(
                                                    height: 80,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFBCC2E5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
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
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                    color: Color(
                                                                        0xFF292D50)),
                                                                child: Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/invoiceLogo.png',
                                                                      height:
                                                                          35,
                                                                      color: Colors
                                                                          .white,
                                                                    ))),
                                                          ),
                                                          Text(
                                                            'View\n Invoice',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xff272d4d),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
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
                                                      color: Color(0xFFBCC2E5),
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
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  color: Color(
                                                                      0xFF292D50)),
                                                              child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          4.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/customerLogo.png',
                                                                    height: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                        ),
                                                        Text(
                                                          'Create\n Customer',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xff272d4d),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
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
                                                      color: Color(0xFFBCC2E5),
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
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  color: Color(
                                                                      0xFF292D50)),
                                                              child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/managementLogo.png',
                                                                    height: 25,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                        ),
                                                        Text(
                                                          'Document\n Management',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xff272d4d),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
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
                                                      color: Color(0xFFBCC2E5),
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
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  color: Color(
                                                                      0xFF292D50)),
                                                              child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          4.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/inventoryLogo.png',
                                                                    height: 35,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                        ),
                                                        Text(
                                                          'View\n Inventory',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xff272d4d),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .supervisor_account_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Add User',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .account_balance,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Add Bank Account',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .business_center_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Update Company Profile',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50)),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .person_outline,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Data Sync',
                                                            style: GoogleFonts.poppins(
                                                                fontSize: 15,
                                                                color:
                                                                    Colors.blue,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
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
                                                  left: 12.0,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Text(
                                                'Blogs',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    color: Color(0xFF474646),
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 70,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // bottomNavigationBar: BottomNavigationBar(items: [
                                  //   ListItem('')
                                  // ],),
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
      ]);
    }),
    Scaffold(body: Text("Hello2")),
    Scaffold(
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
//   TextButton(
//   onPressed: () => showDialog<String>(
//   context: context,
//   builder: (BuildContext context) => AlertDialog(
//   title: Text('Alert'),
//   content: Text("Are you sure you want to sign out?"),
//   actions: [
//   TextButton(
//   onPressed: () {
//   Get.back();
//   },
//   child: Text("No"),
//   ),
//   TextButton(
//   onPressed: () async {
//   SharedPreferences prefs =
//       await SharedPreferences.getInstance();
//   prefs.remove('userData');
//   Get.offAll(LoginScreen());
// },
// child: Text(
// "Yes",
// style: TextStyle(color: Colors.deepPurple),
// ))
// ],
// actionsAlignment: MainAxisAlignment.spaceBetween,
// ),
// ),
// child: Text('Sign Out',
// style: GoogleFonts.poppins(
// color: Colors.black,
// fontSize: 15,
// ))),
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
                child: StatefulBuilder(builder: (context, setWidgetState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 10.0, bottom: 0, right: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, bottom: 12),
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
                                        width: 2, color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.search),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          2.7 /
                                          5,
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
                                          onChanged: (text) {
                                            _filteredList.clear();
                                            if (text.isEmpty) {
                                              setWidgetState(() {});
                                              return;
                                            }

                                            _list.forEach((userDetail) {
                                              if ((userDetail.invNumber ?? "")
                                                      .contains(searchController
                                                          .text) ||
                                                  userDetail.customerName
                                                      .contains(searchController
                                                          .text)) {
                                                _filteredList.add(userDetail);
                                              }
                                            });
                                            searching = _filteredList.length <
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
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          setWidgetState(() {
                                            searching = false;
                                          });
                                          searchController.clear();
                                          onSearchTextChanged(setWidgetState);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                  child: Image.asset(
                                'assets/images/searchFilter.png',
                                height: 25,
                              )),
                            )
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
                              searching == true ? _filteredList : _list),
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
          }),
    ),
    Scaffold(body: Text("Hello4")),


  ];



  static onSearchTextChanged(Function setWidgetState) async {
    _filteredList.clear();
    if (searchController.text.isEmpty) {
      setWidgetState(() {});
      return;
    }

    _list.forEach((userDetail) {
      if ((userDetail.invNumber ?? "").contains(searchController.text) ||
          userDetail.customerName.contains(searchController.text))
        _filteredList.add(userDetail);
    });
    searching = _filteredList.length < _list.length ? true : false;
    print(searching);
    print(" Length Length cjbdcvbjbv c           ${_filteredList.length}");
    setWidgetState(() {});
  }

  static List<Widget> listChildren(List<DataInvoiceList> list) {
    final children = <Widget>[];
    for (int i = 0; i < list.length; i++) {
      String date1 = list[i].invDate;
      String status1 = list[i].status;
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
                              color: list[i].status == 'NEW'
                                  ? Colors.blue
                                  : list[i].status == 'DRAFT'
                                      ? Colors.yellow
                                      : list[i].status == 'CANCEL'
                                          ? Colors.red
                                          : Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, right: 4, top: 2, bottom: 2),
                            child: Text(
                              list[i].status == 'NEW'
                                  ? 'Issued'
                                  : list[i].status == 'CANCEL'
                                      ? 'Cancelled'
                                      : "${status1[0].toUpperCase()}${status1.substring(1).toLowerCase()}",
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
                                height: 20, color: Colors.grey)),
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
                          list[i].invoiceValue != null
                              ?
                              // list[i].invoiceValue is double ?
                              //     oCcy.format(double.parse(list[i].invoiceValue.toString()).abs())
                              // :
                              // oCcy.format(int.parse(list[i].invoiceValue.toString()).abs())
                              'INR ${list[i].invoiceValue}'
                              : '',
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

  void _onItemTapped(int index) {
    // index == 2 ? Get.to(() => InvoiceList()) :
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xE1C2C0C0),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),

            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Invoices',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
