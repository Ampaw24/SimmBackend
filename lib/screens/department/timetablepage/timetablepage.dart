// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, unused_local_variable

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/firebase/firebaseapi.dart';
import 'package:simbackend/utils/colors.dart';

import '../../../core/text.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  TextEditingController assignmentTitleController = TextEditingController();
  TextEditingController assignmentDescriptionController =
      TextEditingController();

  final storageRef = FirebaseStorage.instance.ref();

  String selectedFileName = "Attach File";
  String? filename;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;


  Future<void> _pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["doc", "pdf", "docx", "jpg"],
        type: FileType.any,
        allowCompression: true,
      );

      if (result != null) {
        final filePath = result.files.single.path!;
        pickedFile = result.files.first;
        filename = result.files.first.name;

        setState(() => fileToDisplay = File(filePath));

        fileToDisplay = File(pickedFile!.path.toString());
      } else {}
      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  late DatabaseReference dbRef;

  Future uploadFile() async {
    if (fileToDisplay == null) {
      final fileName = fileToDisplay!.path;
      final destination = 'Assignment/${fileName}';

      FirebaseApi.uploadFile(destination, fileToDisplay!);
    }
  }

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Assignment');
  }

  @override
  Widget build(BuildContext context) {
    final sfileName =
        fileToDisplay != null ? fileToDisplay!.path : "No file selected";
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              centerTitle: true,
              bottom: TabBar(indicatorColor: AppColor.btnBlue, tabs: [
                Text(
                  "Upload Timetable",
                  style: GoogleFonts.montserrat(),
                ),
                Text(
                  "History",
                  style: GoogleFonts.montserrat(),
                )
              ]),
              title: Text(
                "TimeTables",
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.btnBlue),
              ),
            )),
        body: TabBarView(
          children: [
            Tab(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Program',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextFormField(
                        controller: assignmentTitleController,
                        decoration: InputDecoration(
                            hintText: 'Enter Program.. e.g computer Science',
                            hintStyle: TextStyle(
                                fontSize: 10,
                                color: const Color.fromARGB(255, 95, 95, 95),
                                fontStyle: FontStyle.italic)),
                      ),
                      SizedBox(height: 30),
                      SizedBox(height: 16),
                      Container(
                        height: 30,
                        width: 300,
                        child: Center(
                          child: Text(sfileName),
                        ),
                      ),
                      GestureDetector(
                        onTap: _pickFile,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.attach_file,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Choose File",
                                  style: GoogleFonts.montserrat(
                                      textStyle: subheaderBoldbtnwhite),
                                ),
                              ],
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
                        onTap: () {
                          Map<String, String> assignment = {
                            'title': assignmentTitleController.text,
                            'description': assignmentDescriptionController.text,
                          };
                          uploadFile();

                          dbRef.push().set(assignment).then((_) {
                            Flushbar(
                              title: "Assignment Sent",
                              message:
                                  "Assignment ${assignmentTitleController.text} posted",
                              duration: Duration(seconds: 4),
                              icon: Icon(Icons.done_outline_rounded,
                                  color: Colors.white),
                              backgroundColor: Color.fromARGB(255, 22, 149, 195)
                                  .withOpacity(0.6),
                              flushbarPosition: FlushbarPosition.TOP,
                              animationDuration: Duration(milliseconds: 500),
                              borderRadius: BorderRadius.circular(10),
                              margin: EdgeInsets.all(8.0),
                              onTap: (flushbar) {
                                flushbar.dismiss();
                              },
                            ).show(context);

                            assignmentTitleController.text = "";
                            assignmentDescriptionController.text = "";
                          }).catchError((_) {
                            Flushbar(
                              title: "Assignment Post Error",
                              message:
                                  "Assignment ${assignmentTitleController.text} Error",
                              duration: Duration(seconds: 4),
                              icon: Icon(Icons.done_outline_rounded,
                                  color: Colors.white),
                              backgroundColor: Color.fromARGB(255, 237, 51, 51)
                                  .withOpacity(0.6),
                              flushbarPosition: FlushbarPosition.TOP,
                              animationDuration: Duration(milliseconds: 300),
                              borderRadius: BorderRadius.circular(10),
                              margin: EdgeInsets.all(8.0),
                              onTap: (flushbar) {
                                flushbar.dismiss();
                              },
                            ).show(context);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              "Upload",
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
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
