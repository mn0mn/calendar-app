import 'package:get/get.dart';

class Apod {
  static final Rx<String> image = ''.obs;
  static final Rx<String> title = ''.obs;
  Future<void> getImage() async {
    try {
      await GetConnect()
          .get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
          .then((value) => value.body)
          .then(
        (value) {
          if (value != null) {
            title.value = value['title'];
            image.value = value['url'];
          }
        },
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error getting the APOD',
        middleText: e.toString(),
      );
      getImage();
    }
  }
}
