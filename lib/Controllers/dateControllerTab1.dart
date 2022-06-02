import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateControllerTab1 extends GetxController{
  var timeRange = DateTimeRange(start: DateTime.now(), end: DateTime.now() ).obs;


  changeTimeRange(newTimeRange){
    timeRange = newTimeRange;
  }
}

