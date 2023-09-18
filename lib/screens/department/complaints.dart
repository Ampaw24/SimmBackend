// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

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
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
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
              "Messages",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
                  subtitle: Text(messages[index].message),
                  onTap: () {}),
            );
          }),
    );
  }
}


//  Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   child: Text(
//                     "All Messages",
//                     style: GoogleFonts.roboto(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: AppColor.btnBlue),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 10),
//                   padding: const EdgeInsets.only(bottom: 2),
//                   height: 20,
//                   width: 30,
//                   decoration: BoxDecoration(
//                       color: AppColor.mainBlueOpc,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Container(
//                     margin: const EdgeInsets.only(
//                       left: 10,
//                     ),
//                     child: Text(
//                       mess.length.toString(),
//                       style: GoogleFonts.roboto(
//                           color: Colors.white, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
            
//           ],
//         ),