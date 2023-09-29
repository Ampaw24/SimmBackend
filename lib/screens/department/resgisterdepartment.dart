// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/Specs/colors.dart';
import 'package:simbackend/screens/department/departmentlogin.dart';
import 'package:simbackend/config/firebase/firebaseAuth.dart';
import 'package:simbackend/utils/colors.dart';

import '../../Specs/password_field.dart';
import '../../Specs/text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FireAuth _fireAuth = FireAuth();

  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  late DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.ref().child('Departmentdetails');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    "Add Department Details",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColor.btnBlue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: textFormField(
                        controller: _nameController,
                        hintText: "Department name",
                        borderWidth: 2,
                        borderRadius: 10,
                        validateMsg: "Field required",
                        labelStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                        keyboardType: TextInputType.multiline,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ]),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: textFormField(
                        controller: _studentIdController,
                        hintText: "Department Code e.g. cps ",
                        borderWidth: 2,
                        borderRadius: 10,
                        validateMsg: "Field required",
                        labelStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                        ),
                        keyboardType: TextInputType.multiline,
                        inputFormatters: <TextInputFormatter>[]),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.all(10),
                    child: PasswordField(
                      controller: _passwordController,
                      hintText: "Password",
                      borderWidth: 2,
                      borderRadius: 10,
                      removeBorder: true,
                      validateMsg: "Field required",
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.all(10),
                    child: PasswordField(
                      controller: _confirmPasswordController,
                      hintText: "Confirm Password",
                      borderWidth: 2,
                      borderRadius: 10,
                      removeBorder: true,
                      validateMsg: "Field required",
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, String> admindetails = {
                        'name': _nameController.text,
                        'mail':
                            "${_studentIdController.text}@simatu.com",
                      };

                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        print("Password not match");
                        return;
                      }

                      setState(() {
                        _isLoading = true;
                      });

                      String result = await _fireAuth.signUp(
                        email: "${_studentIdController.text}@simatu.com",
                        studentId: _studentIdController.text,
                        name: _nameController.text,
                        password: _passwordController.text,
                      );
                      ref
                          .push()
                          .set(admindetails)
                          .then((_) => print('Admin Added'))
                          .catchError((e) => print(e));

                      setState(() {
                        _isLoading = false;
                      });
                      if (result == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepartmentLogin(),
                          ),
                        );
                       
                      } else {
                        print("$result");
                      }
                    },
                    child: Container(
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                        color: DARKBLUE,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 24,
                            color: WHITE,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DepartmentLogin()));
                          },
                          child: Text("Login"))
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
