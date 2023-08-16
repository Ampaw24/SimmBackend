// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/departmenthome.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import '../constants/responsive.dart';
import 'department/departmentlogin.dart';
import 'lectureview/lecloginpage.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.35,
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 30,
              ),
              padding: const EdgeInsets.all(120),
              width: 300,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png")),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text(
                            "Welcome",
                            style:
                                GoogleFonts.montserrat(textStyle: header1Bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: MediaQuery.of(context).size.width >= 1680
                              ? EdgeInsets.only(top: 40)
                              : EdgeInsets.only(top: 30),
                          height: 300,
                          width: 400,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: Center(
                                  child: Text(
                                    "Select an option to begin...",
                                    style: GoogleFonts.montserrat(
                                        textStyle: subheaderBold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LecturerLogin())),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Lecturer ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: subheaderBoldbtn),
                                    ),
                                  ),
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: AppColor.mainBlue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DepartmentLogin())),
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Center(
                                    child: Text(
                                      "Department",
                                      style: GoogleFonts.montserrat(
                                          textStyle: subheaderBoldbtn),
                                    ),
                                  ),
                                  height: 50,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: AppColor.mainBlue,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.mainBlueOpc,
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(2, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
