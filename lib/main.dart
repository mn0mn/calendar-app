import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/Controllers/quote_controller.dart';
import 'package:calendar_app/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      initialBinding: BindingsBuilder(
        () {
          Get.put(QuoteController());
          Get.put(DateController());
        },
      ),
      getPages: [GetPage(name: '/', page: () => MainScreen())],
    );
  }
}
