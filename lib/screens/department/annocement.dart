// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, sort_child_properties_last
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _assignmentCollection =
      FirebaseDatabase.instance.ref('Department_Announcement');
  late DatabaseReference dbRef;
  late DatabaseReference addRef;
  bool isHostelPortalChecked = false;
  bool isAttachmentChecked = false;
  TextEditingController textFieldController = TextEditingController();
  final _portalCollection = FirebaseDatabase.instance.ref('PortalCheck');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Department_Annoucement');
    addRef = FirebaseDatabase.instance.ref().child('PortalCheck');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textFieldController.dispose();
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
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Announcement',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    String announcement = _announcementController.text;
                    Map<String, String> annoucements = {
                      'title': _titleController.text,
                      'description': _announcementController.text,
                    };
                    if (announcement.isNotEmpty) {
                      dbRef.push().set(annoucements).then((_) {
                        _titleController.text = "";
                        _announcementController.text = "";
                      }).catchError((_) {});
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: AlignmentDirectional.centerEnd,
                  child: ExpansionTile(
                    leading: Icon(Icons.app_registration_rounded),
                    title: Text("Portal Registration"),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Select Options:',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isHostelPortalChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isHostelPortalChecked = newValue!;
                                    });
                                  },
                                ),
                                Text('Hostel Portal'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isAttachmentChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isAttachmentChecked = newValue!;
                                    });
                                  },
                                ),
                                Text('Attachment'),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Additional Information:',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: textFieldController,
                              decoration: InputDecoration(
                                labelText: 'Enter text',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: AppColor.mainBlueOpc,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.announcement,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      String additional =
                                          textFieldController.text;

                                      Map<String, String> _potal = {
                                        'HostelPortalCkeck':
                                            isHostelPortalChecked.toString(),
                                        'AttachmentPortalChecked':
                                            isAttachmentChecked.toString(),
                                        'ButtonInfo': textFieldController.text
                                      };
                                      if (additional.isNotEmpty) {
                                        addRef.push().set(_potal).then((_) {
                                          textFieldController.text = " ";
                                        });
                                      }
                                    },
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Announce",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                            )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
