import 'dart:convert';

import 'package:calendar_app/Models/times_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

Future<String?> getTimes(Position position) async {
  var url =
      "https://api.aladhan.com/v1/timings/''?latitude=${position.latitude}&longitude=${position.longitude}&method=2";
  print(url);
  try {
    return await GetConnect().get(url).then((value) => value.bodyString);
  } catch (e) {
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Error',
      ),
    );
  }
}
