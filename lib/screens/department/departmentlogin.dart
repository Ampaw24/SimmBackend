// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison, use_build_context_synchronously
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/firebase/firebaseauth.dart';
import 'package:simbackend/screens/department/resgisterdepartment.dart';
import 'package:simbackend/screens/lectureview/lecturedashboard.dart';
import 'package:simbackend/screens/text.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DepartmentLogin extends StatefulWidget {
  DepartmentLogin({super.key});

  @override
  State<DepartmentLogin> createState() => _DepartmentLoginState();
}

class _DepartmentLoginState extends State<DepartmentLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _staffIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.10,
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 3.0,
                  child: Container(
                    width: 300,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image:
                          DecorationImage(image: AssetImage("assets/logo.png")),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      child: Column(
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
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Text(
                                      "Department Account",
                                      style: GoogleFonts.montserrat(
                                        textStyle: subheaderBold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
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
                                            return 'Department special Id is required';
                                          }
                                          return null;
                                        },
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
                                    onTap: () async {
                                      try {
                                        setState(() {
                                          _isloading =
                                              true; // Start showing the loader
                                        });
                                        final user = await _auth
                                            .signInWithEmailAndPassword(
                                                email: _staffIdController.text,
                                                password:
                                                    _passwordController.text);
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LecturerDashboard()));
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: GoogleFonts.montserrat(
                                              textStyle: subheaderBoldbtnwhite),
                                        ),
                                      ),
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: AppColor.mainBlue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationScreen())),
                                    child: Center(
                                      child: Text(
                                        "--Add Department Account--",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: AppColor.btnBlue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
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
                          if (_isloading)
                            Center(child: CircularProgressIndicator())
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//  try {
//                                         final user = await _auth
//                                             .signInWithEmailAndPassword(
//                                                 email: _staffIdController.text,
//                                                 password:
//                                                     _passwordController.text);
//                                         if (user != null) {
//                                           Navigator.pushReplacement(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       LecturerDashboard()));
//                                         }
//                                       } catch (e) {
//                                         print(e);
//                                       }