// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:readmore/readmore.dart';
import '../../modules/messagemodeule.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  List<MessageModule> messages = [
    MessageModule("assets/profile.jpg", "Mathematees",
        "I don't get you sir hbsddgfdbfdbfdbfbfbfbfdjhhdhdhdhdhdh"),
    MessageModule("assets/user.png", "Mathematees", "I don't get you sir "),
    MessageModule("assets/user.png", "Mathematees", "I don't get you sir "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Students Complaints",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.btnBlue),
            ),
          )),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              elevation: 5,
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                    // You can use an image here for the user profile picture
                    backgroundColor: Colors.blue,
                    child: Text(
                      messages[index]
                          .userProfileImage, // Display the first letter of the username
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(messages[index].userName),
                  subtitle: ReadMoreText(
                    messages[index].message,
                    trimLines: 1,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: ' show less',
                    lessStyle: TextStyle(color: AppColor.btnBlue),
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueAccent),
                  ),

                  // Text(messages[index].message),
                  onTap: () {}),
            );
          }),
    );
  }
}


