// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/lectureview/announcements.dart';
import 'package:simbackend/screens/lectureview/assignmentpage.dart';
import 'package:simbackend/screens/lectureview/messageview.dart';
import 'package:simbackend/screens/lectureview/profile.dart';
import 'package:simbackend/screens/lectureview/schedulespage.dart';
import '../../modules/dashboardmodule.dart';
import '../../utils/colors.dart';
import '../../widget/dashboardcard.dart';
import '../text.dart';

class LecturerDashboard extends StatefulWidget {
  const LecturerDashboard({super.key});

  @override
  State<LecturerDashboard> createState() => _LecturerDashboardState();
}

List<DashboardCard> cardcontent = [
  DashboardCard(
      navigate: ManageAssignment(),
      title: "Assignment",
      cardIcon: FontAwesomeIcons.fileText,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: Messages(),
      title: "Messages",
      cardIcon: FontAwesomeIcons.message,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: Announcements(),
      title: "Announce \nment",
      cardIcon: FontAwesomeIcons.bullhorn,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: LProfileUpdate(),
      title: "Profile",
      cardIcon: FontAwesomeIcons.userPen,
      cardColor: AppColor.mainBlue),
];
String removeAt(String mail) {
  int atIndex = mail.indexOf("@");
  if (atIndex != -1) {
    return mail.substring(0, atIndex);
  } else {
    return mail;
  }
}

class _LecturerDashboardState extends State<LecturerDashboard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            leading: Container(),
            actions: [
              Text(
                "Hello,",
                style: GoogleFonts.montserrat(fontSize: 15),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                removeAt(FirebaseAuth.instance.currentUser!.email.toString()),
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: AppColor.btnBlue),
              ),
              SizedBox(
                width: 70,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: OutlinedButton.icon(
                    onPressed: () {
                      Get.to(LProfileUpdate());
                    },
                    icon: Icon(Icons.person),
                    label: Text("Profile")),
              )
            ],
            backgroundColor: Colors.white,
          ),
          preferredSize: const Size.fromHeight(60)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Text(
              "Dashboard",
              style: GoogleFonts.montserrat(textStyle: headerboldblue2),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
              ),
              itemCount:
                  cardcontent.length, // Total number of items in the grid
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                    child: DashboarddCards(
                  navigatePage: cardcontent[index].navigate,
                  cardColor: cardcontent[index].cardColor,
                  cardIcon: cardcontent[index].cardIcon,
                  title: cardcontent[index].title,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
