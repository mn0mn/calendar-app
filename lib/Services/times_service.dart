import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<String?> getTimes(Position position) async {
  var url =
      "https://api.aladhan.com/v1/timings/''?latitude=${position.latitude}&longitude=${position.longitude}&method=2";
  print(url);
  try {
    var then = await GetConnect().get(url).then((value) => value);
    if (!then.isOk) {
      getTimes(position);
    } else {
      return then.bodyString;
    }
  } catch (e) {
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Error',
      ),
    );
  }
}
