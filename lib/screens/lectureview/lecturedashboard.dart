// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/widget/dashboardcard.dart';
import '../../widget/sidebar.dart';
import '../../widget/sidebartile.dart';

class LecturerView extends StatefulWidget {
  const LecturerView({super.key});

  @override
  State<LecturerView> createState() => _LecturerViewState();
}

class _LecturerViewState extends State<LecturerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: AppColor.mainBlue,
          ),
          preferredSize: Size.fromHeight(70)),
      body: Row(
        children: [
          SidebarNew(),
          Container(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 170,
                    ),
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Dashboard",
                      cardColor: AppColor.cardBlue,
                      cardIcon: FontAwesomeIcons.tachometerAlt,
                    ),
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Assignment",
                      cardColor: AppColor.cardRed,
                      cardIcon: FontAwesomeIcons.graduationCap,
                    ),
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Schedule",
                      cardColor: AppColor.cardYellow,
                      cardIcon: FontAwesomeIcons.calendarTimes,
                    ),
                  ],
                ),
                Row(
                  children: [
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Message",
                      cardColor: AppColor.mainBlueLight,
                      cardIcon: FontAwesomeIcons.message,
                    ),
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Annoucement",
                      cardColor: AppColor.cardGreen,
                      cardIcon: FontAwesomeIcons.bullhorn,
                    ),
                    DashboardCard(
                      pageNavigate: () {},
                      cardText: "Profile",
                      cardColor: AppColor.mainBlue,
                      cardIcon: FontAwesomeIcons.user,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
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
          "Edmund Bleo \n Lecturer",
          style: GoogleFonts.montserrat(textStyle: subheaderBoldbtn2),
        ),
      ],
    );
  }
}
