// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, unused_local_variable

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../text.dart';

class ManageAssignment extends StatefulWidget {
  const ManageAssignment({super.key});

  @override
  State<ManageAssignment> createState() => _ManageAssignmentState();
}

class _ManageAssignmentState extends State<ManageAssignment> {
  TextEditingController assignmentTitleController = TextEditingController();
  TextEditingController assignmentDescriptionController =
      TextEditingController();
  TextEditingController file = TextEditingController();
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
        type: FileType.any,
        allowCompression: true,
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        filename = result.files.first.name;
        pickedFile = result.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        print("Print file: ${filename}");
      } else {}
      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Assignment');
  }

  @override
  Widget build(BuildContext context) {
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
                  "Create",
                  style: GoogleFonts.montserrat(
                    textStyle: subheaderBold,
                  ),
                ),
                Text(
                  "Manage",
                  style: GoogleFonts.montserrat(
                    textStyle: subheaderBold,
                  ),
                )
              ]),
              title: Text(
                "Assignment",
                style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.btnBlue),
              ),
            )),
        body: TabBarView(
          children: [
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Tab(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Assignment Title',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              controller: assignmentTitleController,
                              decoration: InputDecoration(
                                hintText: 'Enter title',
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Assignment Description',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              controller: assignmentDescriptionController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Enter description',
                              ),
                            ),
                            SizedBox(height: 16),
                            // Add widgets for file upload here
                            // You can use a package like file_picker to handle file uploads
                            SizedBox(height: 16),
                            Container(
                              height: 30,
                              width: 300,
                              color: Colors.red,
                              child: Center(
                                child: Text(filename.toString()),
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
                                  'description':
                                      assignmentDescriptionController.text,
                                };
                                final selctedFile =
                                    storageRef.child(pickedFile.toString());
                                    
                                dbRef.push().set(assignment).then((_) {
                                  print("Data Pushed succefulluy");
                                  Flushbar(
                                    title: "Assignment Sent",
                                    message:
                                        "Assignment ${assignmentTitleController.text} posted",
                                    duration: Duration(seconds: 4),
                                    icon: Icon(Icons.done_outline_rounded,
                                        color: Colors.white),
                                    backgroundColor:
                                        Color.fromARGB(255, 22, 149, 195)
                                            .withOpacity(0.6),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    animationDuration:
                                        Duration(milliseconds: 500),
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
                                    backgroundColor:
                                        Color.fromARGB(255, 237, 51, 51)
                                            .withOpacity(0.6),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    animationDuration:
                                        Duration(milliseconds: 300),
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
