import 'dart:convert';
import 'dart:developer';

import 'package:calendar_app/Models/qoute_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteService {
  static const url = 'https://zenquotes.io/api/today';

  Future<Quote> getQuote() async {
    bool ok = false;
    var i = 0;
    while (!ok && i <= 5) {
      log('quote attempt $i');
      var req = await GetConnect().get(url);
      if (req.isOk) {
        ok = true;
        return Quote.fromJson(req.body[0]);
      }
    }
    Get.dialog(
        const AlertDialog(
          content: Text('Oops :)'),
        ),
        barrierDismissible: true,
        useSafeArea: true);
    return Quote(':(', 'Error getting the Quote');
  }
}
