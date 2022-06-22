import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Models/organizationsListByUserId.dart';

class BlogWebview extends StatefulWidget {
  BlogWebview({Key? key}) : super(key: key);

  @override
  State<BlogWebview> createState() => _BlogWebviewState();
}

class _BlogWebviewState extends State<BlogWebview> {

  String titleLink = Get.arguments[0];

  var reqUrl = Uri.parse('https://slate.ac/');

  var finalURL;

  late String title;

  @override
  Widget build(BuildContext context) {
    title = "${titleLink.replaceAll('-', ' ')}";
    finalURL =
    "${reqUrl}${titleLink}/";
    print("$finalURL");
    return MyScaffold(
        company1: "",
        setStateDrawer:setState,
        company: "",
        title: Text("${title[0].toUpperCase()}${title.substring(1).toLowerCase()}"),
        body: WebView(
                  initialUrl: Uri.encodeFull(finalURL),
                  javascriptMode: JavascriptMode.unrestricted,
                  zoomEnabled: false,
                )
    );
  }
}
