// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, unused_local_variable, avoid_unnecessary_containers, prefer_final_fields
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/firebase/firebaseapi.dart';
import 'package:simbackend/screens/department/timetablepage/timetablehis.dart';
import 'package:simbackend/screens/lectureview/loc.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'TimetablePage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  TextEditingController assignmentTitleController = TextEditingController();
  TextEditingController assignmentDescriptionController =
      TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _submitTime = TextEditingController();
  TextEditingController _submitDate = TextEditingController();
  final storageRef = FirebaseStorage.instance.ref();
  DateTime selectedDate = DateTime.now();

  String selectedFileName = "Attach File";
  String? filename;
  PlatformFile? pickedFile;
  bool _isLoading = false;
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
    final destination = 'TimeTable/$fileName';

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
    dbRef = FirebaseDatabase.instance.ref().child('TimeTable');
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
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
                "Timetable Notice",
                style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: AppColor.btnBlue),
              ),
            )),
        body: TabBarView(
          children: [
            Tab(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: assignmentTitleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter title',
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: assignmentDescriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter description',
                        ),
                      ),
                      SizedBox(height: 16),
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
                                      strutStyle: StrutStyle(fontSize: 12.0),
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.black),
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
                          setState(() {
                            _isLoading = true;
                          });
                          await uploadFile();
                          Map<String, String> assignment = {
                            'title': assignmentTitleController.text,
                            'description': assignmentDescriptionController.text,
                            'file-url': downloadUrl,
                          };

                          dbRef.push().set(assignment).then((_) {
                            GetSnackBar(
                                title: "Notice Sent",
                                message:
                                    "Timetable Notice ${assignmentTitleController.text} posted",
                                animationDuration: Duration(seconds: 2),
                                isDismissible: true,
                                snackPosition: SnackPosition.TOP);

                            assignmentTitleController.text = "";
                            assignmentDescriptionController.text = "";

                            setState(() {
                              _isLoading = false;
                            });
                          }).catchError((_) {
                            setState(() {
                              _isLoading = false;
                            });
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
                      SizedBox(
                        height: 20,
                      ),
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: TimeTableHistory(),
            )
          ],
        ),
      ),
    );
  }
}
