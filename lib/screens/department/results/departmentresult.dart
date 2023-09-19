// ignore_for_file: unused_field, prefer_const_constructors

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

class ResultUpload extends StatefulWidget {
  const ResultUpload({super.key});

  @override
  State<ResultUpload> createState() => _ResultUploadState();
}

class _ResultUploadState extends State<ResultUpload> {
  File? file;
  // ignore: prefer_const_declarations
  static final String title = 'Firebase Upload';
  UploadTask? task;

  int _currentStep = 0;
  String? selectedProgram;
  String? selectedLevel;
  final resultNoticeReference = FirebaseDatabase.instance.ref("Results");
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
    dbRef = FirebaseDatabase.instance.ref().child('Results');
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
      body: Center(
        child: Column(
          children: [
            Stepper(
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep == 0 && selectedProgram != null) {
                  // Check if the program is selected before proceeding to the next step
                  setState(() {
                    _currentStep++;
                  });
                } else if (_currentStep == 1 && selectedLevel != null) {
                  // Check if the level is selected before submitting the form
                  _submitForm();
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              },
              steps: [
                Step(
                  subtitle: Text("Select Program for Result Upload Notice"),
                  title: Text('Select Program'),
                  isActive: _currentStep == 0,
                  content: DropdownButtonFormField<String>(
                    value: selectedProgram,
                    items: programs.map((program) {
                      return DropdownMenuItem<String>(
                        value: program,
                        child: Text(program),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedProgram = value;
                      });
                    },
                  ),
                ),
                Step(
                  title: Text('Select Level'),
                  isActive: _currentStep == 1,
                  content: DropdownButtonFormField<String>(
                    value: selectedLevel,
                    items: levels.map((level) {
                      return DropdownMenuItem<String>(
                        value: level,
                        child: Text(level),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value;
                      });
                    },
                  ),
                ),
              ],
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
            SizedBox(height: 48),
            GestureDetector(
              onTap: () async {
                Map<String, String> resultNotice = {
                  "Selected Program": selectedProgram.toString(),
                  "Level": selectedLevel.toString(),
                };
                await dbRef!.push().set(resultNotice).then((_) {
                  Get.showSnackbar(GetSnackBar(
                    title: "Result Uploaded",
                    message: "Frersrsrsrsrs",
                  ));
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonWidget(
                  text: 'Upload',
                  icon: Icons.cloud_upload_outlined,
                  onClicked:(){},
                ),
              ),
            ),
            SizedBox(height: 20),
            task != null ? buildUploadStatus(task!) : Container(),
          ],
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
