import 'dart:ui';

import 'package:calendar_app/Controllers/quote_controller.dart';
import 'package:calendar_app/Services/qotd_service.dart';
import 'package:calendar_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteBox extends StatelessWidget {
  QuoteBox({Key? key}) : super(key: key);
  var controller = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      QuoteService.isLoading.value;
      return Container(
        margin: const EdgeInsets.fromLTRB(26, 30, 26, 12),
        height: 290,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 247, 250, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [flagBox()],
        ),
      );
    });
  }

  Widget flagBox() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          children: [
            SizedBox(
              height: 165,
              child: Container(
                margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(color: Colors.transparent),
            )
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 55,
          width: 60,
          margin: const EdgeInsets.only(left: 25),
          decoration: const BoxDecoration(
              // color: Colors.white,
              ),
          child: SvgPicture.asset(
            QuoteSVG,
            allowDrawingOutsideViewBox: true,
            clipBehavior: Clip.none,
            color: Colors.white,
            placeholderBuilder: (context) => CircularProgressIndicator(),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
