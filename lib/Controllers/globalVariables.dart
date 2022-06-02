import 'package:flutter/material.dart';

import '../Models/DateFormatModel.dart';
import '../Models/companyIDModel.dart';
import '../Models/organizationsListByUserId.dart';
import '../Views/home.dart';
import '../Views/selectCompany.dart';

var userDataGlobal;


class MyScaffold extends StatelessWidget {

  final Widget body;
  final Widget tittle;

  MyScaffold({required this.body, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  tittle,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF272D4D),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)))),
      body: body,

    );
  }
}