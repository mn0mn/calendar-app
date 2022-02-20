import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayWidget extends StatelessWidget {
  TodayWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 45),
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          Obx(
            () {
              controller.update();
              return Text(
                'Today, ${controller.now.value}',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 27),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Text('${controller.now.value} '),
          const Text('Hi')
        ],
      ),
    );
  }
}
