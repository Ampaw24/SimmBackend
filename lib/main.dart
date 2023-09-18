// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simbackend/screens/selectpage.dart';
import 'package:get/get.dart';
import 'package:simbackend/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Info Manager',
      theme: ThemeData(
        dialogTheme: DialogTheme(backgroundColor: Colors.white),
        datePickerTheme: DatePickerThemeData(
            backgroundColor: Colors.white,
            rangePickerBackgroundColor: Colors.blue),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: SelectPage(),
    );
  }
}
