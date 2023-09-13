// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, sort_child_properties_last

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';
import '../text.dart';

class DepartmentAnnoucements extends StatefulWidget {
  const DepartmentAnnoucements({super.key});

  @override
  State<DepartmentAnnoucements> createState() => _DepartmentAnnoucementsState();
}

class _DepartmentAnnoucementsState extends State<DepartmentAnnoucements> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _announcementController = TextEditingController();
  late DatabaseReference dbRef;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Department_Annoucement');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text(
              "Annoucement",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.btnBlue),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Make Annoucement To Sudents",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: AppColor.btnBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Announcement Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: _announcementController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Announcement',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    // Handle the announcement submission here
                    String announcement = _announcementController.text;
                    Map<String, String> annoucements = {
                      'title': _titleController.text,
                      'description': _announcementController.text,
                    };
                    if (announcement.isNotEmpty) {
                      dbRef.push().set(annoucements).then((_) {
                        Flushbar(
                          title: "Announcement Sent",
                          message:
                              "Assignment ${_announcementController.text} posted",
                          duration: Duration(seconds: 10),
                          icon: Icon(Icons.done_outline_rounded,
                              color: Colors.white),
                          backgroundColor: Color.fromARGB(255, 97, 106, 109)
                              .withOpacity(0.6),
                          flushbarPosition: FlushbarPosition.TOP,
                          animationDuration: Duration(milliseconds: 500),
                          borderRadius: BorderRadius.circular(10),
                          margin: EdgeInsets.all(8.0),
                          onTap: (flushbar) {
                            flushbar.dismiss();
                          },
                        ).show(context);

                        _titleController.text = "";
                        _announcementController.text = "";
                      }).catchError((_) {
                        Flushbar(
                          title: "Assignment Post Error",
                          message:
                              "Assignment ${_announcementController.text} Error",
                          duration: Duration(seconds: 10),
                          icon: Icon(Icons.done_outline_rounded,
                              color: Colors.white),
                          backgroundColor:
                              Color.fromARGB(255, 237, 51, 51).withOpacity(0.6),
                          flushbarPosition: FlushbarPosition.TOP,
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: BorderRadius.circular(10),
                          margin: EdgeInsets.all(8.0),
                          onTap: (flushbar) {
                            flushbar.dismiss();
                          },
                        ).show(context);
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        "Send Announcement",
                        style: GoogleFonts.montserrat(
                            textStyle: subheaderBoldbtnwhite),
                      ),
                    ),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColor.mainBlue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
  // onPressed: () {
  //                   // Handle the announcement submission here
  //                   String announcement = _announcementController.text;
  //                   if (announcement.isNotEmpty) {
  //                     // You can send the announcement to a server, database, or perform any desired action.
  //                     // For now, we'll just print it.
  //                     print('Announcement: $announcement');
  //                     // Optionally, you can clear the text field.
  //                     _announcementController.clear();
  //                   }
  //                 },