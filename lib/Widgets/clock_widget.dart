import 'dart:math' as math;

import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget(Key? key,
      {required this.hour, required this.minute, required this.color})
      : super(key: key);
  final int hour, minute;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3.4),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(190, 196, 202, 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            Center(
              child: Transform.rotate(
                alignment: Alignment.center,
                angle: ((math.pi * 2) / 12) * hour,
                child: SizedBox(
                  height: 16,
                  width: 1.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 8,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: ((math.pi * 2) / 60) * minute,
                child: SizedBox(
                  width: 1.5,
                  height: 20,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: color == Colors.white
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget timesHeader() {
    var controller = Get.find<DateController>();
    return Container(
      margin: const EdgeInsets.fromLTRB(36, 45, 0, 25),
      child: Row(
        children: [
          Obx(
            () => ClockWidget(UniqueKey(),
                color: Colors.white,
                hour: controller.now.value.hour,
                minute: controller.now.value.minute),
          ),
          const SizedBox(width: 12),
          Text(
            'Times',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: const Color(0xff2a3a50),
            ),
          )
        ],
      ),
    );
  }
}
