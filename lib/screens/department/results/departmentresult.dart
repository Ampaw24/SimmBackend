// ignore_for_file: unused_field, prefer_const_constructors, prefer_final_fields

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simbackend/core/text.dart';
import 'package:simbackend/utils/colors.dart';
import '../../../api/firebase_api.dart';
import '../../../widget/button_widget.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ResultUpload extends StatefulWidget {
  const ResultUpload({super.key});

  @override
  State<ResultUpload> createState() => _ResultUploadState();
}

class _ResultUploadState extends State<ResultUpload> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _noticeController = TextEditingController();
  bool _isLoading = false;

  File? file;
  // ignore: prefer_const_declarations
  static final String title = 'Firebase Upload';
  UploadTask? task;

  int _currentStep = 0;
  String? selectedProgram;
  String? selectedLevel;
  final resultNoticeReference = FirebaseDatabase.instance.ref("Results_Notice");

  late final String fileUrl;
  // Define your list of programs and levels here

  List<String> programs = [
    'Mechanical Engineering',
    'Civil Engineering',
    'Electrical Engineering'
  ];
  List<String> levels = ['Level 100', 'Level 200', 'Level 300', 'Level 400'];

  // This method is called when the user submits the form
  void _submitForm() {
    // Perform actions to submit the form data, e.g., send to a server or save to local storage
    print('Program: $selectedProgram');
    print('Level: $selectedLevel');
    // You can add more logic here as needed

    // Reset the form
    setState(() {
      _currentStep = 0;
      selectedProgram = null;
      selectedLevel = null;
    });
  }

  DatabaseReference? dbRef;
  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child('Results_Notice');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Result Notice",
          style: headerboldblue2,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _isLoading ? Center(child: CircularProgressIndicator(),):Container(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text("Department"),
                      SizedBox(height: 12.0),
                      TextFormField(
                        controller: _departmentController,
                        decoration: InputDecoration(
                          labelText: 'Enter Department Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the department';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      SizedBox(height: 12.0),
                      Text("Notice"),
                      SizedBox(height: 12.0),
                      TextFormField(
                        controller: _noticeController,
                        decoration: InputDecoration(
                          labelText: 'Enter Result Notice Message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the result notice';
                          }
                          return null;
                        },
                        maxLines: 3, // Multiline input
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonWidget(
                  text: 'Select File',
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    fileName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(height: 38),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonWidget(
                  text: 'Submit',
                  icon: Icons.cloud_upload_outlined,
                  onClicked: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await uploadFile();
                    Map<String, String> resultNotice = {
                      "Selected Department": _departmentController.text,
                      "Notice_Message": _noticeController.text,
                      "fileUploade": fileUrl,
                    };

                    await dbRef!.push().set(resultNotice).then((_) {
                      Get.showSnackbar(
                        GetSnackBar(
                        titleText: Text("Results Uploaded"),
                        backgroundColor: Colors.black45,
                        snackPosition: SnackPosition.BOTTOM,
                        title: "Result Uploaded",
                        message:
                            "Results Notice has been sent to ${_departmentController.text} students!",
                      ));
                      setState(() {
                        _isLoading = false;
                      });
                    });
                    if (_formKey.currentState!.validate()) {
                      // Process and save the form data here
                      // For example, you can send it to a server
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

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

    print('Download-Link: $urlDownload');
    setState(() {
      fileUrl = urlDownload;
    });
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
