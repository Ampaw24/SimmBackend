// ignore_for_file: sort_child_properties_last, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/lecturer/lecturer.dart';
import 'package:simbackend/screens/department/profileupdate.dart';
import 'package:simbackend/screens/department/results/departmentresult.dart';
import 'package:simbackend/screens/lectureview/announcements.dart';
import 'package:simbackend/screens/lectureview/assignmentpage.dart';
import 'package:simbackend/screens/lectureview/messageview.dart';
import 'package:simbackend/screens/lectureview/profile.dart';
import '../../modules/dashboardmodule.dart';
import '../../utils/colors.dart';
import '../../widget/dashboardcard.dart';
import '../../widget/navdrawer.dart';
import '../text.dart';
import 'annocement.dart';
import 'messages.dart';

class DepartmentDashboard extends StatefulWidget {
  String departmentMail;
  DepartmentDashboard({super.key, required this.departmentMail});

  @override
  State<DepartmentDashboard> createState() => _DepartmentDashboardState();
}

List<DashboardCard> cardcontent = [
  DashboardCard(
      navigate: DepartmentMessages(),
      title: "Messages",
      cardIcon: FontAwesomeIcons.message,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: DepartmentAnnoucements(),
      title: "Announce \nments",
      cardIcon: FontAwesomeIcons.bullhorn,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: ResultUpload(),
      title: "Results",
      cardIcon: FontAwesomeIcons.fileText,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: BTMnav(pageIndex: 1),
      title: "Lecturers",
      cardIcon: FontAwesomeIcons.userTie,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: ManageAssignment(),
      title: "TimeTable",
      cardIcon: FontAwesomeIcons.squarePollVertical,
      cardColor: AppColor.mainBlue),
  DashboardCard(
      navigate: ProfileUpdate(),
      title: "Profile",
      cardIcon: FontAwesomeIcons.userPen,
      cardColor: AppColor.mainBlue),
];

class _DepartmentDashboardState extends State<DepartmentDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(mail: widget.departmentMail),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            leading: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu_outlined)),
            // leading: IconButton(onPressed: onPressed, icon: icon),
            actions: [
              SizedBox(
                width: 110,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/catprofile.JPG"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
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
