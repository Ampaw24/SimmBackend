import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../../modules/messagemodeule.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  List<MessageModule> mess = [
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir ")
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
            leading: Container(),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                "All Messages",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.btnBlue),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColor.btnBlue,
                
              ),
            )

              ],
            ),

          ],
        ),
      ),
    );
  }
}
