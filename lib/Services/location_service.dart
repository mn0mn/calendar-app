import 'package:flutter/cupertino.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocationService {
  Position? _position;
  late Address _address;

  get getUserPosition async {
    return await _getUserPosition();
  }

  Future<void> _getUserPosition() async {
    await Geolocator.requestPermission();

    var pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
      forceAndroidLocationManager: true,
      timeLimit: const Duration(minutes: 1, seconds: 30),
    ).then((value) => _position = value);
  }

  Future<void> _getUserAdderss() async {
    if (_position == null) {
      await _getUserPosition()
          .onError((error, stackTrace) => throw error.toString());
    }
    try {
      _address = await GeoCode().reverseGeocoding(
          latitude: _position!.latitude, longitude: _position!.longitude);
    } catch (e) {
      throw e;
    }
  }
}
