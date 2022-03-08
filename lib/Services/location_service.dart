import 'package:calendar_app/Models/times_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'package:get/get.dart';

class LocationService {
  get userPosition async {
    return await getUserPosition();
  }

  Future<Position> getUserPosition() async {
    await Geolocator.requestPermission();

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      forceAndroidLocationManager: true,
      timeLimit: const Duration(minutes: 1, seconds: 30),
    );
  }

  static Image getFlag(String location) {
    return Image.network(
      'https://countryflagsapi.com/png/${location}',
      loadingBuilder: (context, child, loadingProgress) =>
          CircularProgressIndicator(),
      alignment: Alignment.center,
      fit: BoxFit.cover,
    );
  }
}
