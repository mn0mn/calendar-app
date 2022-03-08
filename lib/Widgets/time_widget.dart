import 'package:calendar_app/Controllers/date_controller.dart';
import 'package:calendar_app/Widgets/clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeBox extends StatelessWidget {
  TimeBox(
      {Key? key,
      required this.hour,
      required this.minute,
      required this.name,
      required this.color})
      : super(key: key);
  final String hour, minute;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      height: 100,
      width: 160,
      child: Column(children: [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 10, 0),
              child: ClockWidget(
                UniqueKey(),
                color: color,
                hour: hour == '-' ? 0 : int.parse(hour),
                minute: minute == '-' ? 0 : int.parse(minute),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ],
        ),
        Text(
          '$hour:$minute',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 30),
        )
      ]),
    );
  }
}
