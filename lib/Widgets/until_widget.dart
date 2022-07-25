import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/Models/times_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class UntillWidget extends StatelessWidget {
  UntillWidget({Key? key}) : super(key: key);

  final controller = Get.find<DateController>();
  final Rx<String> remainingTime = ''.obs;

  String upcomingEvent(DateTime now) {
    if (controller.timings.value.asr != '-:-') {
      var list = DateTimeTimings(now, controller.timings.value).toList();
      var ans = list.firstWhere((element) => now.isBefore(element));
      var hour = ((ans.difference(now).inHours)).floor().toString();
      var minute = ans.difference(now).inMinutes.remainder(60).isLowerThan(10)
          ? ans
              .difference(now)
              .inMinutes
              .remainder(60)
              .toString()
              .padLeft(2, '0')
          : ans.difference(now).inMinutes.remainder(60).toString();
      remainingTime.value = hour + ':' + minute;
      return times[list.indexOf(ans)];
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 23, 0, 30),
      child: Obx(
        () => Text.rich(
          TextSpan(
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(128, 42, 58, 80),
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text:
                    'Remaining time untill ${upcomingEvent(controller.now.value)} : ',
              ),
              TextSpan(
                style: GoogleFonts.poppins(
                  color: const Color(0xff2a3a50),
                  fontStyle: FontStyle.italic,
                  fontSize: null,
                ),
                text: remainingTime.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
