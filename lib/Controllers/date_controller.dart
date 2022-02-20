import 'dart:async';

import 'package:calendar_app/constants/constants.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;

  @override
  void onInit() {
    _dateTimestream.listen((event) async {
      now.value = event;
      update();
    });
    super.onInit();
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
