import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arabic_numbers/arabic_numbers.dart' show ArabicNumbers;
import 'package:google_fonts/google_fonts.dart';

class TodayWidget extends StatelessWidget {
  TodayWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 45,
          ),
          Obx(
            () {
              return Text(
                'Today, ' + weekDaysList[controller.now.value.weekday]!,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                ),
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () {
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${controller.now.value.day} '
                          '${monthsList[controller.now.value.month]}, ',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '${controller.now.value.year}',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: const Color(0x66ffffff),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 4,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(
                '${ArabicNumbers().convert(controller.hijri.value.day)} ${controller.hijri.value.month.ar}, ${ArabicNumbers().convert(controller.hijri.value.year)}',
                style: const TextStyle(
                  letterSpacing: 0.2,
                  fontFamily: 'Kalameh',
                  color: Color(0x66ffffff),
                  fontSize: 20.2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
