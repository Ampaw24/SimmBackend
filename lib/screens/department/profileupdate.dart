// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/departmenthome.dart';
import 'package:simbackend/screens/department/departmentlogin.dart';
import 'package:simbackend/screens/selectpage.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  GlobalKey _formkey = GlobalKey();
  Uint8List? _image;
  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.btnBlue),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: _image != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              image: DecorationImage(
                                  image: MemoryImage(_image!),
                                  fit: BoxFit.cover)),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              image: DecorationImage(
                                  image: AssetImage('assets/catprofile.JPG'),
                                  fit: BoxFit.cover)),
                        ),
                ),
                Positioned(
                    top: 110,
                    left: 210,
                    child: GestureDetector(
                      onTap: _selectImage,
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.add_a_photo,
                            weight: 10,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.mainBlue,
                        ),
                      ),
                    )),
              ],
            ),
            Text(
              "Engineering",
              style: GoogleFonts.roboto(textStyle: headerboldblue1),
            ),
            Text(
              "Department",
              style: GoogleFonts.roboto(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Center(
                          child: TextFormField(
                            // controller: _staffIdController,
                            decoration: InputDecoration(
                              labelText: 'Department Mail',
                            ),
                          ),
                        ),
                        height: 50,
                        width: 300,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: TextFormField(
                            // controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            // validator: _validatePassword(),
                          ),
                        ),
                        height: 50,
                        width: 300,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        margin: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: TextFormField(
                            // controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                            ),
                            // validator: _validatePassword(),
                          ),
                        ),
                        height: 50,
                        width: 300,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepartmentLogin())),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              "Update",
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
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.to(SelectPage());
                },
                icon: Icon(
                  Icons.logout,
                  color: AppColor.btnBlue,
                ),
                label: Text(
                  "Logout",
                  style: TextStyle(color: AppColor.btnBlue),
                ))
          ],
        ),
      ),
    );
  }
}
