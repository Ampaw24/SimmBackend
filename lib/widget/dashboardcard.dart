import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';

class DashboardCard extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final Color cardColor;
  final VoidCallback pageNavigate;

  DashboardCard(
      {super.key,
      required this.cardIcon,
      required this.cardText,
      required this.cardColor, required this.pageNavigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 40),
        padding: const EdgeInsets.all(30),
        height: 170,
        width: 250,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Icon(
                cardIcon,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                cardText,
                style: GoogleFonts.montserrat(textStyle: subheaderBoldbtn),
              )
            ],
          ),
        ),
      ),
    );
  }
}
