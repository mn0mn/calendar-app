import 'package:get/get_connect/http/src/utils/utils.dart';

class TimesModel {
  static String tillMidnight(DateTime time) {
    DateTime midnight =
        DateTime(time.year, time.month, (time.day + 1), 0, 1, 0);
    var diff = midnight.difference(time).inMinutes;

    var remainder = diff.remainder(60);
    return (diff / 60).floor().toString() +
        ':' +
        (remainder < 10 ? '0$remainder' : remainder).toString();
  }
}
