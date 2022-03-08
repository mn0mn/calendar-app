// ignore_for_file: avoid_print

import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/Models/qoute_model.dart';
import 'package:calendar_app/Services/location_service.dart';
import 'package:calendar_app/Services/qotd_service.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController {
  var quote = Quote('auther', 'Quote').obs;
  @override
  void onInit() async {
    await QuoteService().getQuote().then((value) => quote.value = value);
    super.onInit();
  }
}
