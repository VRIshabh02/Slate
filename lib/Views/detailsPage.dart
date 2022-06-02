import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Models/organizationsListByUserId.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  String titleLink = Get.arguments[0];
  var company= Get.arguments[1];
  var reqUrl = Uri.parse('dev.finance.slate.ac/mobile-app/');
  var finalURL;
  var title;

  @override
  Widget build(BuildContext context) {
    title = "${titleLink.split('/')[1][0].toUpperCase()}${titleLink.split('/')[1].substring(1).toLowerCase()}";
    return MyScaffold(
        tittle: Text("$title"),
        body: FutureBuilder(
            future: organizationListApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                OrganizationsListByUserId organizationsData =
                    snapshot.data as OrganizationsListByUserId;
                finalURL =
                "https://${reqUrl}${titleLink}/${organizationsData.ret.data[company].orgId}/${userDataGlobal['ret']['data']['token']}";

                return WebView(
                  initialUrl: Uri.encodeFull(finalURL),
                  javascriptMode: JavascriptMode.unrestricted,
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
            }));
  }
}
