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

class LProfileUpdate extends StatefulWidget {
  const LProfileUpdate({super.key});

  @override
  State<LProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<LProfileUpdate> {
  GlobalKey _formkey = GlobalKey();
  bool _isLoading = false;
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _Cpasswordcontroller = TextEditingController();
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
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/user.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: GoogleFonts.roboto(textStyle: headerboldblue2),
            ),
            Text(
              "Lecturer Profile",
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
                        margin: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: TextFormField(
                            controller: _passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
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
                            controller: _Cpasswordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                          ),
                        ),
                        height: 50,
                        width: 300,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          if (_passwordcontroller.text ==
                              _Cpasswordcontroller.text) {
                            await FirebaseAuth.instance.currentUser!
                                .updatePassword(
                                    _passwordcontroller.text.toString())
                                .then((_) => Get.showSnackbar(GetSnackBar(
                                      title: "Password Update Success",
                                      message:
                                          "Pasword Update for Department Successful",
                                      snackPosition: SnackPosition.TOP,
                                    )));
                            _passwordcontroller.text = " ";
                            _Cpasswordcontroller.text = " ";
                          } else {
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "An Error Occured while Updating Password")));
                          }
                        },
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
