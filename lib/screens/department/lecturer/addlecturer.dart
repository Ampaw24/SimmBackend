// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:simbackend/config/firebase/firebaseAuth.dart';
import '../../../core/text.dart';
import '../../../utils/colors.dart'; // For date formatting

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecturer Details',
      home: LecturerForm(),
    );
  }
}

class LecturerForm extends StatefulWidget {
  @override
  _LecturerFormState createState() => _LecturerFormState();
}

class _LecturerFormState extends State<LecturerForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _specController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _name = '';
  String _gender = 'Male';
  String _educationSpecialization = '';
  String _password = '';
  String _confirmPassword = '';
  String? _generatedMail;

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform some action (e.g., save data)
      print('Name: $_name');
      print('Gender: $_gender');
      print('Education Specialization: $_educationSpecialization');
      print('Date of Birth: ${_dateController.text}');
    }
  }

  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Lecturers');
  }

  FireAuth _fireAuth = FireAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecturer Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Email Generated: username @simatu.com",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Enter FullName'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Create Username'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your User name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text('Gender: '),
                    Radio<String>(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _specController,
                  decoration:
                      InputDecoration(labelText: 'Education Specialization'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your education specialization';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _educationSpecialization = value!;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate != null) {
                          _dateController.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      },
                    ),
                  ),
                  controller: _dateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value!;
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    Map<String, String> lecturer = {
                      "LecturerName": _nameController.text,
                      "Gender": _gender,
                      "Course-Lecture": _specController.text,
                      "Birth Date": _dateController.text,
                    };
                    dbRef!.push().set(lecturer).then((_) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email:
                              "${_usernameController.text.trim()}@simatu.com",
                          password: _passwordController.text);
                      Get.snackbar("Lecturer Added",
                          "Lecturer ${_nameController.text} added Successfully!!",
                          duration: Duration(seconds: 5),
                          snackPosition: SnackPosition.TOP);
                      _nameController.text = "";
                      _passwordController.text = "";
                      _confirmPasswordController.text = "";
                      _dateController.text = "";
                      _educationSpecialization = " ";
                      _usernameController.text = "";
                      _specController.text = "";

                      setState(() {
                        _generatedMail = _usernameController.text;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        "Add Lecturer",
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
      ),
    );
  }
}
