// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/widget/sidebar.dart';
import '../../utils/sidebar2.dart';
import '../../widget/dashboardcard.dart';

class LecturerView extends StatefulWidget {
  const LecturerView({super.key});

  @override
  State<LecturerView> createState() => _LecturerViewState();
}

class _LecturerViewState extends State<LecturerView> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: AppColor.mainBlue,
          ),
          preferredSize: Size.fromHeight(70)),
      body: Row(
        children: [SidebarNew()],
      ),
    );
  }
}

class SidebarNew extends StatelessWidget {
  const SidebarNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.80,
      width: 300,
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
            top: 20,
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
              left: 80,
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
              left: 120,
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
            top: 200,
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  color: Colors.red,
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
