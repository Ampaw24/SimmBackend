// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/lectureview/lecturedashboard.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

import '../department/departmenthome.dart';

class DepartmentLogin extends StatefulWidget {
  DepartmentLogin({super.key});

  @override
  State<DepartmentLogin> createState() => _DepartmentLoginState();
}

class _DepartmentLoginState extends State<DepartmentLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _staffIdController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.20,
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                ),
                padding: const EdgeInsets.all(120),
                width: MediaQuery.of(context).size.width <= 500 ? 250 : 300,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Welcome ",
                              style: GoogleFonts.montserrat(
                                  textStyle: header1Bold),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "Enter  Login Credentials...",
                              style: GoogleFonts.montserrat(
                                  textStyle: subheaderBold),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: MediaQuery.of(context).size.width <= 500
                                ? EdgeInsets.only(right: 20, top: 20)
                                : EdgeInsets.only(top: 70),
                            // padding: const EdgeInsets.only(bottom: 90),
                            height: 300,
                            width: 450,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Text(
                                    " Department Account",
                                    style: GoogleFonts.montserrat(
                                      textStyle: subheaderBold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  child: Center(
                                    child: TextFormField(
                                      controller: _staffIdController,
                                      decoration: InputDecoration(
                                        labelText: 'Department ID',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Staff ID is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  height: 50,
                                  width: 300,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor.mainBlue),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      // validator: _validatePassword(),
                                    ),
                                  ),
                                  height: 50,
                                  width: 300,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LecturerView())),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.montserrat(
                                            textStyle: subheaderBoldbtn),
                                      ),
                                    ),
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: AppColor.mainBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.mainBlueOpc,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(2, 5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
