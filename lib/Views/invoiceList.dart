import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled_slate/Controllers/dateControllerTab1.dart';
import 'package:untitled_slate/Controllers/globalVariables.dart';
import 'package:untitled_slate/Models/InvoiceListModel.dart';
import 'package:untitled_slate/Views/home.dart';
import 'package:untitled_slate/Views/selectCompany.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Models/DateFormatModel.dart';
import '../Models/companyIDModel.dart';
import '../Models/dashboardCardsModel.dart';
import '../Models/organizationsListByUserId.dart';
import 'calender.dart';
import 'invoiceList.dart';
import 'invoicesListDead.dart';
import 'login.dart';


