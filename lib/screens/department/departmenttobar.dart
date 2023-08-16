import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/imagerow.dart';
import '../lectureview/lecturedashboard.dart';
import '../text.dart';

class DepartmentTopNavBar extends StatelessWidget {
  const DepartmentTopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: AppColor.mainBlue,
        child: Row(
          children: [
            ImageRowText(),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Icon(
                Icons.message,
                color: AppColor.mainBlue,
              )),
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.notifications, color: AppColor.mainBlue),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              // padding: const EdgeInsets.all(10),
              width: 170,
              height: 50,
              child: DepartmentProfileDetail(),
            ),
          ],
        ),
      ),
    );
  }
}

class DepartmentProfileDetail extends StatelessWidget {
  const DepartmentProfileDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7),
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/catprofile.JPG"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Computer Science \n Department",
          style: GoogleFonts.montserrat(textStyle: subheaderBoldbtn2),
        ),
      ],
    );
  }
}
