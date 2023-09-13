import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/text.dart';

class DashboarddCards extends StatelessWidget {
  final String title;
  final int counter;
  final IconData cardIcon;
  final Color cardColor;
  final Widget navigatePage;

  const DashboarddCards(
      {super.key,
      required this.title,
      required this.cardIcon,
      required this.counter,
      required this.cardColor,
      required this.navigatePage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(navigatePage,transition: Transition.zoom),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 5),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 10,
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  textStyle: dashboardCardTitle,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 10,
              child: Text(
                counter.toString(),
                style: GoogleFonts.montserrat(
                  textStyle: dashboardCardcount,
                ),
              ),
            ),
            Positioned(
                top: 80,
                left: 95,
                child: Container(
                  height: 40,
                  width: 38,
                  child: Icon(
                    cardIcon,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.45),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
