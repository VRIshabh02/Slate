import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Calender extends StatefulWidget {
   Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  String date1= 'gg';

  @override
  Widget build(BuildContext context) {
    String date;

    return Scaffold(
      body: Column(),
    );

      // Scaffold(
      //   body: Center(
      //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         GestureDetector(
      //           onTap: (){
      //             Get.dialog(
      //               Column(
      //                 children: [
      //                   Container(
      //                   height: 300,
      //                   child: CupertinoDatePicker(
      //                     backgroundColor: Colors.white,
      //                     mode: CupertinoDatePickerMode.date,
      //                     initialDateTime: DateTime(2022, 1, 1),
      //                     onDateTimeChanged: (DateTime newDateTime) {
      //                       print('$newDateTime');
      //                       date = '${newDateTime}';
      //                       print('${date.split(' ')}');
      //                       final splitted = date.split(' ');
      //                       print('${splitted[0]}');
      //                       setState(() {
      //                         date1 = splitted[0];
      //                       });
      //                     },
      //                   ),
      //             ),
      //               GestureDetector(
      //                 onTap: (){
      //                   Get.back();
      //                 },
      //                 child: Container(
      //                   height: 30,
      //                   width: 200,
      //                   decoration: BoxDecoration(
      //                       color: Colors.deepPurple,
      //                       borderRadius: BorderRadius.circular(12)
      //                   ),
      //                   child: Center(child: Text('Done', style: GoogleFonts.roboto(fontSize: 15, decoration: TextDecoration.none),)),
      //                 ),
      //             )
      //                 ],
      //               )
      //             );
      //           },
      //           child: Container(
      //             height: 30,
      //             width: 200,
      //             decoration: BoxDecoration(
      //               color: Colors.deepPurple,
      //               borderRadius: BorderRadius.circular(12)
      //             ),
      //             child: Center(child: Text('Start date')),
      //           ),
      //         ),
      //         Text('${date1}')
      //
      //       ],
      //     ),
      //   ),
      // );
  }
}
