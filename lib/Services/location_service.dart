import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'package:get/get.dart';

class LocationService {
  get userPosition async {
    return await getUserPosition();
  }

  Future<Position> getUserPosition() async {
    await Geolocator.requestPermission();

    const duration = Duration(minutes: 1, seconds: 30);
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      forceAndroidLocationManager: true,
    ).timeout(
      duration,
      onTimeout: () {
        Get.defaultDialog(title: 'Loc error');
        return getUserPosition();
      },
    );
  }

  static Image getFlag(String location) {
    return Image.network(
      'https://countryflagsapi.com/png/$location',
      loadingBuilder: (context, child, loadingProgress) =>
          const CircularProgressIndicator(),
      alignment: Alignment.center,
      fit: BoxFit.cover,
    );
  }
}
