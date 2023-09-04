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
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
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
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.only(bottom: 2),
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColor.mainBlueOpc,
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      mess.length.toString(),
                      style: GoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      " mess[0].message",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
