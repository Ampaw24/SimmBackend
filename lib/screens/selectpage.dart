// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/lectureview/lecturedashboard.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'department/departmentlogin.dart';
import 'lectureview/lecloginpage.dart';
import 'department/departmenthome.dart';
import 'package:get/get.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
            children: [
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 3.0,
                child: Container(
                  width: 300,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png")),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 150),
                          child: Center(
                            child: Text(
                              "Welcome",
                              style: GoogleFonts.montserrat(
                                  textStyle: header1Bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: 250,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Center(
                                    child: Text(
                                      "Select an option to begin",
                                      style: GoogleFonts.montserrat(
                                          textStyle: subheaderBold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(LecturerLogin(),
                                      transition: Transition.downToUp),
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "Lecturer ",
                                        style: GoogleFonts.montserrat(
                                            textStyle: subheaderBoldbtnwhite),
                                      ),
                                    ),
                                    height: 50,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: AppColor.mainBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(DepartmentLogin(),
                                      transition: Transition.downToUp),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Center(
                                      child: Text(
                                        "Department",
                                        style: GoogleFonts.montserrat(
                                            textStyle: subheaderBoldbtnwhite),
                                      ),
                                    ),
                                    height: 50,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: AppColor.mainBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
      ),
    ));
  }
}
