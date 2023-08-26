// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/lectureview/announcements.dart';
import 'package:simbackend/screens/lectureview/assignmentpage.dart';
import 'package:simbackend/screens/lectureview/messageview.dart';
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
      cardColor: AppColor.dashboardGreen),
  DashboardCard(
      navigate: MessageView(),
      title: "Messages",
      cardIcon: FontAwesomeIcons.message,
      cardColor: AppColor.dashboardYellow),
  DashboardCard(
      navigate: Annoucements(),
      title: "Announce \nment",
      cardIcon: FontAwesomeIcons.bullhorn,
      cardColor: AppColor.dashboardRed),
  DashboardCard(
      navigate: Schedules(),
      title: "Users",
      cardIcon: FontAwesomeIcons.clockRotateLeft,
      cardColor: AppColor.dashboardBrown),
];

class _LecturerDashboardState extends State<LecturerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            actions: [
              Text(
                "Hello,",
                style: GoogleFonts.montserrat(fontSize: 23),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Kevin",
                style: GoogleFonts.montserrat(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: AppColor.btnBlue),
              ),
              SizedBox(
                width: 110,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/catprofile.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
            leading: Icon(Icons.menu_outlined),
            backgroundColor: Colors.white,
          ),
          preferredSize: const Size.fromHeight(60)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              "Dashboard",
              style: GoogleFonts.montserrat(textStyle: headerbold1),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  counter: cardcontent[index].counter,
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
