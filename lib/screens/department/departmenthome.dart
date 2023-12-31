// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/lecturer/lecturer.dart';
import 'package:simbackend/screens/department/profileupdate.dart';
import 'package:simbackend/screens/department/results/departmentresult.dart';
import 'package:simbackend/screens/department/timetablepage/timetablepage.dart';
import '../../modules/dashboardmodule.dart';
import '../../utils/colors.dart';
import '../../widget/dashboardcard.dart';
import '../../widget/navdrawer.dart';
import '../text.dart';
import 'annocement.dart';
import 'complaints.dart';

class DepartmentDashboard extends StatefulWidget {
  DepartmentDashboard({super.key});

  @override
  State<DepartmentDashboard> createState() => _DepartmentDashboardState();
}

class _DepartmentDashboardState extends State<DepartmentDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:
          NavDrawer(mail: FirebaseAuth.instance.currentUser!.email.toString()),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            title: Text(
              "",
              style: GoogleFonts.montserrat(
                color: AppColor.btnBlue,
              ),
            ),
            leading: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu_outlined)),
            actions: [
              SizedBox(
                width: 110,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileUpdate())),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: OutlinedButton.icon(
                        onPressed: () {
                          Get.to(ProfileUpdate());
                        },
                        icon: Icon(Icons.person),
                        label: Text("Profile")),
                  ))
            ],
            backgroundColor: Colors.white,
          ),
          preferredSize: const Size.fromHeight(60)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              " Dashboard",
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

List<DashboardCard> cardcontent = [
  DashboardCard(
      navigate: Complaints(),
      title: "Complaints",
      cardIcon: FontAwesomeIcons.message,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: DepartmentAnnoucements(),
      title: "Announce \nments",
      cardIcon: FontAwesomeIcons.bullhorn,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: DepartmentResult(),
      title: "Results\n Notice",
      cardIcon: FontAwesomeIcons.fileText,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: BTMnav(pageIndex: 0),
      title: "Lecturers",
      cardIcon: FontAwesomeIcons.userTie,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: TimetablePage(),
      title: "TimeTable",
      cardIcon: FontAwesomeIcons.squarePollVertical,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: ProfileUpdate(),
      title: "Profile",
      cardIcon: FontAwesomeIcons.userPen,
      cardColor: AppColor.mainBlue),
];
