// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/utils/sidebar.dart';
import '../../utils/sidebar2.dart';
import '../../utils/topnavbar.dart';
import '../../widget/dashboardcard.dart';

class LecturerView extends StatefulWidget {
  const LecturerView({super.key});

  @override
  State<LecturerView> createState() => _LecturerViewState();
}

class _LecturerViewState extends State<LecturerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNavBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Sidebar(),
                Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        DashboardCard(
                          cardText: "Dashboard",
                          cardColor: AppColor.cardBlue,
                          cardIcon: FontAwesomeIcons.tachometerAlt,
                        ),
                        DashboardCard(
                          cardText: "Assignment",
                          cardColor: AppColor.cardRed,
                          cardIcon: FontAwesomeIcons.graduationCap,
                        ),
                        DashboardCard(
                          cardText: "Dashboard",
                          cardColor: AppColor.cardGreen,
                          cardIcon: FontAwesomeIcons.tachometerAlt,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        DashboardCard(
                          cardText: "Message",
                          cardColor: AppColor.mainBlueLight,
                          cardIcon: FontAwesomeIcons.message,
                        ),
                        DashboardCard(
                          cardText: "Annoucement",
                          cardColor: AppColor.cardGreen,
                          cardIcon: FontAwesomeIcons.bullhorn,
                        ),
                        DashboardCard(
                          cardText: "Dashboard",
                          cardColor: Colors.red,
                          cardIcon: FontAwesomeIcons.tachometerAlt,
                        ),
                      ],
                    ),
                  ],
                )
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
