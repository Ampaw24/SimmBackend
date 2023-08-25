// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/widget/sidebartile.dart';

class SidebarNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: 250,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 245, 245),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 225, 223, 255), // Shadow color
              offset: Offset(10, 0), // Offset from the right
              blurRadius: 3, // Spread of the shadow
              spreadRadius: 0, // Optional, controls the "width" of the shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: 10,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/catprofile.jpg'),
                      fit: BoxFit.cover),
                  color: AppColor.mainBlue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Positioned(
              left: 100,
              top: 20,
              child: Container(
                child: Icon(
                  FontAwesomeIcons.pencil,
                  size: 10,
                  color: Colors.white,
                ),
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: AppColor.mainBlue,
                  borderRadius: BorderRadius.circular(13.5),
                ),
              ),
            ),
            Positioned(
                top: 130,
                left: 70,
                bottom: 0,
                right: 0,
                child: Text(
                  "edmunedu.staff.atu.gh",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 13,
                          color: AppColor.mainBlue,
                          fontWeight: FontWeight.w600)),
                )),
            Positioned(
                top: 150,
                left: 100,
                bottom: 0,
                right: 0,
                child: Text("Lecturer",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: AppColor.mainBlue,
                          fontWeight: FontWeight.w500),
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 170),
              child: Divider(
                color: AppColor.mainBlueOpc,
              ),
            ),
            Positioned(
              top: 180,
              child: Column(
                children: [
                  SideBarTile(
                    tileText: "Dashboard",
                    iconcard: FontAwesomeIcons.tachometer,
                  ),
                  SideBarTile(
                    tileText: "Manage Assignment",
                    iconcard: FontAwesomeIcons.graduationCap,
                  ),
                  SideBarTile(
                    tileText: "Schedules",
                    iconcard: FontAwesomeIcons.calendarTimes,
                  ),
                  SideBarTile(
                    tileText: "Message",
                    iconcard: FontAwesomeIcons.message,
                  ),
                  SideBarTile(
                    tileText: "Annoucements",
                    iconcard: FontAwesomeIcons.hornbill,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
