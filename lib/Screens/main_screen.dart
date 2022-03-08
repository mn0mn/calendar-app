import 'dart:ui';
import 'package:calendar_app/Widgets/widgets.dart';
import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  static const duration = Duration(milliseconds: 252);
  final controller = Get.find<DateController>();

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            HeaderWidget(query: query),
            AnimatedContainer(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              alignment: Alignment.bottomCenter,
              height: query.height / 1.35,
              duration: MainScreen.duration,
              child: SingleChildScrollView(
                dragStartBehavior: DragStartBehavior.start,
                physics: const BouncingScrollPhysics(
                  parent: PageScrollPhysics(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const QuoteBox(),
                    ClockWidget.timesHeader(),
                    timesGrid(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget timesGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeBox(
                    hour: controller.timings.value.fajr.split(':')[0],
                    minute: controller.timings.value.fajr.split(':')[1],
                    name: 'Morning',
                    color: const Color(0xffffece0)),
                TimeBox(
                  hour: controller.timings.value.sunrise.split(':')[0],
                  minute: controller.timings.value.sunrise.split(':')[1],
                  name: 'Rise',
                  color: const Color(0xffffe9e0),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeBox(
                    hour: controller.timings.value.dhuhr.split(':')[0],
                    minute: controller.timings.value.dhuhr.split(':')[1],
                    name: 'Noon',
                    color: const Color(0xffffe0e0)),
                TimeBox(
                    hour: controller.timings.value.asr.split(':')[0],
                    minute: controller.timings.value.asr.split(':')[1],
                    name: 'Evening',
                    color: const Color(0xfffcd4d4))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeBox(
                  hour: controller.timings.value.sunset.split(':')[0],
                  minute: controller.timings.value.sunset.split(':')[1],
                  name: 'Sunset',
                  color: const Color(0xff18bbe3),
                ),
                TimeBox(
                  hour: controller.timings.value.maghrib.split(':')[0],
                  minute: controller.timings.value.maghrib.split(':')[1],
                  name: 'Maghreb',
                  color: const Color(0xff23a9ce),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeBox(
                  hour: controller.timings.value.isha.split(':')[0],
                  minute: controller.timings.value.isha.split(':')[1],
                  name: 'ishaa',
                  color: const Color(0xff3384de),
                ),
                TimeBox(
                  hour: controller.timings.value.midnight.split(':')[0],
                  minute: controller.timings.value.midnight.split(':')[1],
                  name: 'midnight',
                  color: const Color(0xff444fd3),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.query,
  }) : super(key: key);

  final Size query;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: query.height / 3 + 50,
          child: SvgPicture.asset(
            headerSVG,
            width: query.width,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 17, sigmaY: 17.5),
          child: TodayWidget(),
        )
      ],
    );
  }
}
