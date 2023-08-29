// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';

import 'lecturedashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey _formkey = GlobalKey();
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
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  top: 110,
                  left: 210,
                  child: Container(
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.pencil,
                        weight: 10,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.mainBlue,
                    ),
                  )),
            ],
          ),
          Text(
            "David Soweto",
            style: GoogleFonts.roboto(textStyle: headerboldblue1),
          ),
          Text(
            "Lecturer",
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
                            labelText: 'Staff Mail',
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
                              builder: (context) => LecturerDashboard())),
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
          )
        ],
      ),
    );
  }
}
