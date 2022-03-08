import 'dart:convert';

import 'package:calendar_app/Models/qoute_model.dart';
import 'package:get/get.dart';

class QuoteService {
  static const url = 'https://zenquotes.io/api/today';

  Future<Quote> getQuote() async {
    var response = await GetConnect().get(url);
    if (response.isOk) {
      var body = jsonDecode(json.encode(response.body[0]));
      return Quote(body['a'], body['q']);
    } else {
      return Quote(
        'Error getting the Quote',
        '${response.statusCode}',
      );
    }
  }
}
