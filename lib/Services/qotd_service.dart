import 'dart:convert';

import 'package:calendar_app/Models/qoute_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class QuoteService {
  var qoute = Quote('', '').obs;
  RxBool isLoading = true.obs;
  static const url = 'https://zenquotes.io/api/today';

  Future<Quote> getQuote() async {
    var response = await GetConnect().get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      isLoading.value = false;
      return Quote(body['a'], body['q']);
    } else {
      GetSnackBar(
        title: 'Error getting the Quote',
        message: '${response.statusCode}: ${response.statusText}',
      );
      return Quote('', '');
    }
  }
}
