// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simbackend/screens/selectpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Info Manager',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SelectPage(),
    );
  }
}
