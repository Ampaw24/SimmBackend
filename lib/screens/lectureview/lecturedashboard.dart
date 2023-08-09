// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: AppColor.mainBlue,
            child: Row(
           children: [
            ImageRowText(),
            Spacer(),
            Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
            SizedBox(width: 20,),
            Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
             SizedBox(width: 20,),
            Container(
              margin: const EdgeInsets.only(right: 30),
              width: 170,
              height: 60,
              color: Colors.white,
              child: Column(
                children: [
                 Container(
                  margin: const EdgeInsets.only(top: 7),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/catprofile.JPG"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(25),
                  color: Colors.red,

                  ),
                 ),
                 Text("Edmund Bleo"),
                ],
              ),
            ),
           ],
            ),

          )
        ],
      ),
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
          child: Text("SIM",style: GoogleFonts.montserrat(textStyle: header1boldwhite),)),
        Container(
          margin: const EdgeInsets.only(left: 15,),
          child: Text("Lecturer Admin",style: GoogleFonts.montserrat(
          textStyle: subheaderBoldWhite,
        ),)),
         
      ],
    )
      ],
    );
  }
}