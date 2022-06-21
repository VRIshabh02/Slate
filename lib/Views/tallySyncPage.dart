import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';

class TallySync extends StatefulWidget {
  const TallySync({Key? key}) : super(key: key);

  @override
  State<TallySync> createState() => _TallySyncState();
}

class _TallySyncState extends State<TallySync> {

  var company = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        title: Text("Tally Sync"),
        company: company,
        setStateDrawer: setState,
        company1: company,
        body: Container(),
    );
  }
}
