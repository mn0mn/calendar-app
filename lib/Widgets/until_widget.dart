import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UntillWidget extends StatelessWidget {
  UntillWidget({Key? key}) : super(key: key);

  final controller = Get.find<DateController>();
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
              fontSize: 15.2,
            ),
            children: [
              const TextSpan(
                text: 'Remaining time untill midnight : ',
              ),
              TextSpan(
                  style: GoogleFonts.poppins(
                    color: const Color(0xff2a3a50),
                    fontStyle: FontStyle.italic,
                    fontSize: null,
                  ),
                  text: '') //TimesModel.tillMidnight(controller.now.value))
            ],
          ),
        ),
      ),
    );
  }
}
