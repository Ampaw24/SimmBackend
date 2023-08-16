import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';

class SideBarTile extends StatelessWidget {
  const SideBarTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(bottom: 10),
        width: 300,
        height: 60,
        color: Color.fromARGB(111, 86, 62, 226),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.tachometerAlt,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Dashboard",
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