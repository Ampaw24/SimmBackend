// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:file_picker/file_picker.dart';
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

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('Selected file path: ${file.path}');
      print('Selected file name: ${file.name}');
    } else {
      // User canceled the file picker.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text(
              "Manage Assignment",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
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
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                ),
              ),
              SizedBox(height: 16),
              // Add widgets for file upload here
              // You can use a package like file_picker to handle file uploads
              SizedBox(height: 16),
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
                          "Attach File",
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
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Upload Assignment",
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
    );
  }
}
