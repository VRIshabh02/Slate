import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Scaffold(
        backgroundColor: Color(0xE1FFFFFF),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.count(
                    childAspectRatio: 7/3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    padding: EdgeInsets.zero,
                    children: [
                      for(int i =0 ; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Sales'),
                                      Icon(Icons.info, size: 15,color: Colors.grey,)
                                    ],
                                  ),
                                  Text("Rs. 1989532.00")
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),

                GridView.count(
                  childAspectRatio: 4/3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  children: [
                    for(int i =0 ; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xFFBCC2E5),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xFF292D50)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.calendar_today_outlined, size: 30,),
                                      )),
                                ),
                                Text(
                                  'View\n Invoice',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Color(0xff272d4d),
                                      fontWeight: FontWeight.bold),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration:BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.supervisor_account_rounded, color: Colors.white,),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add User',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Divider(thickness: 1,endIndent: 50,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration:BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.account_balance, color: Colors.white,),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add Bank Account',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Divider(thickness: 1,endIndent: 50,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration:BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.business_center_outlined, color: Colors.white,),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Update Company Profile',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Divider(thickness: 1,endIndent: 50,),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration:BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.person_outline, color: Colors.white,),
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Data Sync',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
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
                    padding: const EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
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

                SizedBox(height: 70,)
              ],
            ),
          ),
        ),
      ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xFF272D4D),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft:  Radius.circular(20))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.segment, color: Colors.white,size: 30,),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Home',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.calendar_today_outlined, size: 20,),
                    )),
              )
            ],
          ),
        ),

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
                        Icon(Icons.home_outlined, size: 30,color: Colors.blue,),
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
                        Icon(Icons.dashboard_outlined, size: 30,color: Colors.blue,),
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
                        Icon(Icons.document_scanner, size: 30,color: Colors.blue,),
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
                        Icon(Icons.notifications_none, size: 30,color: Colors.blue,),
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
    ]
    );
  }
}
