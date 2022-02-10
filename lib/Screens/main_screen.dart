import 'package:calendar_app/Services/qotd_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(),
        Container(
          color: Colors.red,
          height: height / 3,
        ),
        Positioned(
          bottom: 0,
          height: height / 1.25,
          right: 0,
          left: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(53),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.vertical,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics:
                  const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
