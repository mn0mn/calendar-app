import 'dart:ui';

import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/Widgets/midnight_widget.dart';
import 'package:calendar_app/Widgets/quote_box_widget.dart';
import 'package:calendar_app/Widgets/today_widget.dart';
import 'package:calendar_app/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  static const duration = Duration(milliseconds: 252);

  const MainScreen({Key? key}) : super(key: key);

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
                physics:
                    const BouncingScrollPhysics(parent: PageScrollPhysics()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [QuoteBox(), QuoteBox(), MidnightWidget()],
                ),
              ),
            )
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
