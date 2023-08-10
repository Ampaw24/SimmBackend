// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

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
          TopNavBar(),
          Row(
        children: [
          SidebarX(
            
            controller: SidebarXController(selectedIndex: 0),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          // Your app screen body
        ],
      ),
        ],
      ),
    );
  }
}

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: AppColor.mainBlue,
      child: Row(
        children: [
          ImageRowText(),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.notifications, color: AppColor.mainBlue),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(right: 50),
            padding: const EdgeInsets.all(10),
            width: 170,
            height: 60,
            child: ProfileDetail(),
          ),
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
                image: AssetImage("assets/catprofile.JPG"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Edmund Bleo \n Lecturer",
          style: GoogleFonts.montserrat(
              textStyle: subheaderBoldbtn2),
        ),
      ],
    );
  }
}

class ImageRowText extends StatelessWidget {
  const ImageRowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage("assets/atulogo.png")),
        ),
        Column(
          children: [
            Container(
                child: Text(
              "SIM",
              style: GoogleFonts.montserrat(textStyle: header1boldwhite),
            )),
            Container(
                margin: const EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Lecturer Admin",
                  style: GoogleFonts.montserrat(
                    textStyle: subheaderBoldWhite,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
