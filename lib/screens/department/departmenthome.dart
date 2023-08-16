// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/departmentsidebar.dart';
import 'package:simbackend/screens/department/departmenttobar.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import '../../utils/sidebar2.dart';
import '../../utils/topnavbar.dart';
import '../../widget/dashboardcard.dart';

class DepartmentView extends StatefulWidget {
  const DepartmentView({super.key});

  @override
  State<DepartmentView> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<DepartmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DepartmentTopNavBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DepartmentSidebar(),
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
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
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
