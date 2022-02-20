import 'package:calendar_app/Models/qoute_model.dart';
import 'package:calendar_app/Services/location_service.dart';
import 'package:calendar_app/Services/qotd_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController {
  var quote = Quote('auther', '').obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    await QuoteService().getQuote();
    super.onInit();
  }

  @override
  void onReady() {
    print('bb');
    // TODO: implement onReady
    GetSnackBar(
      title: 'Ready',
      duration: Duration(seconds: 2),
      backgroundColor: Color(Colors.red.value),
    );
    super.onReady();
    LocationService().getUserPosition;
  }
}
