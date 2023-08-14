// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

class LecturerLogin extends StatelessWidget {
  const LecturerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                ),
                padding: const EdgeInsets.all(120),
                width: 300,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.only(left: 100),
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.height * 0.80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/illustrator.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60, left: 40),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width * 0.50,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Welcome",
                            style:
                                GoogleFonts.montserrat(textStyle: header1Bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Enter Login Credentials...",
                            style: GoogleFonts.montserrat(
                                textStyle: subheaderBold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 100, top: 10),
                          // padding: const EdgeInsets.only(bottom: 90),
                          height: 250,
                          width: 350,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Container(
                                child: Center(
                                  child: TextFormField(
                                    // controller: _staffIdController,
                                    decoration: InputDecoration(
                                      labelText: 'Staff ID',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColor.mainBlue),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return 'Staff ID is required';
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ),
                                height: 50,
                                width: 300,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: TextFormField(
                                    // controller: _passwordController,
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
                                    // validator: _validatePassword,
                                  ),
                                ),
                                height: 50,
                                width: 300,
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
