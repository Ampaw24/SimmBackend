// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, sort_child_properties_last

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../../../core/text.dart';

class DepartmentResult extends StatefulWidget {
  const DepartmentResult({super.key});

  @override
  State<DepartmentResult> createState() => _DepartmentResultState();
}

class _DepartmentResultState extends State<DepartmentResult> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _announcementController = TextEditingController();
  final _assignmentCollection =
      FirebaseDatabase.instance.ref('Department_Result');
  late DatabaseReference dbRef;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Department_Result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text(
              " Result Notice",
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
                _isloading
                    ? CircularProgressIndicator(
                        color: AppColor.btnBlue,
                      )
                    : Container(),
                Text(
                  "Send Result Notice To Sudents",
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
                    labelText: 'Notice Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: _announcementController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Notice Details',
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
                      setState(() {
                        _isloading = true;
                      });
                      dbRef.push().set(annoucements).then((_) {
                        Get.snackbar("Result Notice ",
                            "Result Notice Sent to students sucess");
                        setState(() {
                          _isloading = false;
                        });

                        _titleController.text = "";
                        _announcementController.text = "";
                      }).catchError((e) {
                        Get.snackbar("Error:Result Notice ",
                            "An Error Encountered ${e}");
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
