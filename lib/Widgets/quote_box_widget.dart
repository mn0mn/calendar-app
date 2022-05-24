import 'package:calendar_app/Controllers/quote_controller.dart';
import 'package:calendar_app/Services/apod_service.dart';
import 'package:calendar_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteBox extends StatelessWidget {
  const QuoteBox({Key? key}) : super(key: key);
  static var controller = Get.find<QuoteController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(26, 30, 26, 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 247, 250, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [flagBox(), qouteBox()],
      ),
    );
  }
}

Widget qouteBox() {
  return Obx(
    () => Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flex(
            direction: Axis.vertical,
            children: [
              Text(
                QuoteBox.controller.quote.value.quote,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xff1c1f23),
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: Text(
              QuoteBox.controller.quote.value.auther,
              style: GoogleFonts.poppins(
                color: const Color(0xff9099a3),
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    ),
  );
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
                child: Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Apod.image.value == ''
                            ? Container()
                            : Image.network(
                                Apod.image.value,
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              ),
                        Positioned(
                          bottom: 1,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(right: 2),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            child: Text(
                              Apod.title.value,
                              style: GoogleFonts.poppins(
                                color: Colors.grey[100],
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 20,
            child: Container(color: Colors.transparent),
          )
        ],
      ),
      Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 60,
        margin: const EdgeInsets.only(left: 25),
        decoration: const BoxDecoration(
            // color: Colors.white,
            ),
        child: SvgPicture.asset(
          quoteSVG,
          allowDrawingOutsideViewBox: true,
          clipBehavior: Clip.none,
          color: Colors.white,
          cacheColorFilter: true,
          theme: SvgTheme(currentColor: Colors.grey[300]),
          placeholderBuilder: (context) => const CircularProgressIndicator(),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
      )
    ],
  );
}
