import 'dart:convert';

import 'package:calendar_app/Controllers/quote_controller.dart';
import 'package:calendar_app/Models/qoute_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class QuoteService {
  static var qoute = Quote('', '').obs;
  static RxBool isLoading = true.obs;
  static const url = 'https://zenquotes.io/api/today';

  Future<void> getQuote() async {
    var response = await GetConnect().get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(json.encode(response.body[0]));
      isLoading.value = false;
      qoute.value = Quote(body['a'], body['q']);
      QuoteController().refresh();
    } else {
      GetSnackBar(
        title: 'Error getting the Quote',
        message: '${response.statusCode}: ${response.statusText}',
      );
    }
  }
}
