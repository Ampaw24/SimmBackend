// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, unused_local_variable, avoid_unnecessary_containers, prefer_final_fields
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/firebase/firebaseapi.dart';
import 'package:simbackend/utils/colors.dart';
import '../text.dart';
import 'loc.dart';
import 'manageAssignment.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ManageAssignment extends StatefulWidget {
  const ManageAssignment({super.key});

  @override
  State<ManageAssignment> createState() => _ManageAssignmentState();
}

class _ManageAssignmentState extends State<ManageAssignment> {
  TextEditingController assignmentTitleController = TextEditingController();
  TextEditingController assignmentDescriptionController =
      TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _submitTime = TextEditingController();
  TextEditingController _submitDate = TextEditingController();
  GuardLocationAssignment assignment = GuardLocationAssignment();
  final storageRef = FirebaseStorage.instance.ref();
  DateTime selectedDate = DateTime.now();

  String selectedFileName = "Attach File";
  String? filename;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  File? file;
  // ignore: prefer_const_declarations
  static final String title = 'Firebase Upload';
  UploadTask? task;
  late DatabaseReference dbRef;
  late String downloadUrl;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowCompression: true,
    );

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'Results/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    downloadUrl = urlDownload;

    print('Download-Link: $urlDownload');
  }

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Assignment');
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

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
                      fontSize: 15,
                      color: AppColor.btnBlue,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "Manage",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: AppColor.btnBlue,
                      fontWeight: FontWeight.w300),
                )
              ]),
              title: Text(
                "Assignment",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
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
                                fontSize: 15,
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
                                fontSize: 15,
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
                            SizedBox(height: 10),
                            FormBuilderDateTimePicker(
                              controller: _submitTime,
                              name: 'end_time',
                              inputType: InputType.time,
                              format: DateFormat('h:mm a'),
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.lock_clock),
                                  labelText: 'Submission Time'),
                              onChanged: (value) {
                                assignment.endTime = value!;
                              },
                            ),
                            FormBuilderDateTimePicker(
                              name: 'submission_date',
                              controller: _submitDate,
                              initialValue: selectedDate,
                              inputType: InputType.date,
                              format: DateFormat('yyyy-MM-dd'),
                              decoration: InputDecoration(
                                icon: Icon(Icons.calendar_month),
                                labelText: 'Submission Date',
                              ),
                              onChanged: (DateTime? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedDate = newValue;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Center(
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    alignment: Alignment.center,
                                  ),
                                  onPressed: selectFile,
                                  child: SizedBox(
                                    width: 250,
                                    height: 20,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.file_upload,
                                          color: AppColor.btnBlue,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            strutStyle:
                                                StrutStyle(fontSize: 12.0),
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                text: fileName),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () async {
                                await uploadFile();
                                Map<String, String> assignment = {
                                  'title': assignmentTitleController.text,
                                  'description':
                                      assignmentDescriptionController.text,
                                  'submition-time': _submitTime.text,
                                  'file-url': downloadUrl,
                                  'submission-date': _submitDate.text,
                                };

                                dbRef.push().set(assignment).then((_) {
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
                                  setState(() {
                                    isLoading = false;
                                  });
                                  assignmentTitleController.text = "";
                                  assignmentDescriptionController.text = "";
                                  _submitTime.text = "";
                                  _submitDate.text = " ";
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
              child: Assignments(),
            )
          ],
        ),
      ),
    );
  }
}
