// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/departmenthome.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

import 'department/departmentlogin.dart';
import 'lectureview/lecloginpage.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.only(top: 10, left: 30),
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/illustrator.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    // width: MediaQuery.of(context).size.width / 2,
                    // height: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Welcome",
                            style:
                                GoogleFonts.montserrat(textStyle: header1Bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Select an option to begin...",
                            style: GoogleFonts.montserrat(
                                textStyle: subheaderBold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 100, top: 10),
                          // padding: const EdgeInsets.only(bottom: 90),
                          height: 250,
                          width: 350,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
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
                                  width: 300,
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
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Text(
                                      "Department",
                                      style: GoogleFonts.montserrat(
                                          textStyle: subheaderBoldbtn),
                                    ),
                                  ),
                                  height: 50,
                                  width: 300,
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
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
