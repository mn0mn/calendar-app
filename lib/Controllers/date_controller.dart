// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:calendar_app/Services/location_service.dart';
import 'package:calendar_app/Services/times_service.dart';
import 'package:get/get.dart';

import '../Models/times_model.dart';

class DateController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;
  Rx<Hijri> hijri = Hijri(
      date: 'date',
      format: 'format',
      day: '',
      weekday: HijriWeekday(en: '', ar: ''),
      month: HijriMonth(ar: '', en: '', number: 0),
      year: '',
      designation: Designation(abbreviated: '', expanded: ''),
      holidays: []).obs;

  Rx<Timings> timings = Timings(
    fajr: '-:-',
    sunrise: '-:-',
    dhuhr: '-:-',
    asr: '-:-',
    sunset: '-:-',
    maghrib: '-:-',
    isha: '-:-',
    imsak: '-:-',
    midnight: '-:-',
  ).obs;

  @override
  Future<void> onInit() async {
    _dateTimestream.listen(
      (event) {
        now.value = event;
        update();
      },
    );
    LocationService().getUserPosition().then((value) {
      print(value.toString());
      return getTimes(value);
    }).then((value) {
      if (value == null) {
        print('null body');
      } else {
        print(jsonDecode(value)['data']);
        timings.value = Timings.fromJson(jsonDecode(value)['data']['timings']);
        hijri.value =
            Hijri.fromJson(jsonDecode(value)['data']['date']['hijri']);
      }
    });
  }

  @override
  void onClose() {
    _dateTimestream.listen((event) {}).pause();
    super.onClose();
  }

  final _dateTimestream =
      Stream.periodic(const Duration(seconds: 20), (computationCount) {
    return DateTime.now();
  }).asBroadcastStream();
}
