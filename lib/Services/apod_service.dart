import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Apod {
  static final Rx<String> image = ''.obs;
  static final Rx<String> title = ''.obs;
  Future<void> getImage() async {
    await GetConnect()
        .get('https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY')
        .then((value) => value.body)
        .then((value) {
      title.value = value['title'];
      image.value = value['url'];
    });
  }
}
