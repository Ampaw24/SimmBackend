import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

class SideBarTile extends StatelessWidget {
  final String tileText;
  final IconData iconcard;

  const SideBarTile(
      {super.key, required this.tileText, required this.iconcard});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(bottom: 10),
        width: 300,
        height: 60,
        child: Row(
          children: [
            Icon(
              iconcard,
              size: 30,
              color: AppColor.mainBlue,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              tileText,
              style: GoogleFonts.poppins(
                textStyle: subheaderBoldbtn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
