// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                padding: const EdgeInsets.all(30),
                width: 350,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/illustrator.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                 
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 90),
                          child: Text("Welcome",style: GoogleFonts.montserrat(textStyle: header1Bold),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 90),
                          child: Text("Select an option to begin...",style: GoogleFonts.montserrat(textStyle: subheaderBold),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 130,top: 30),
                          height: 450,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:AppColor.mainBlueOpc,
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
