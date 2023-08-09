// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:simbackend/utils/colors.dart';

class LecturerView extends StatefulWidget {
  const LecturerView({super.key});

  @override
  State<LecturerView> createState() => _LecturerViewState();
}

class _LecturerViewState extends State<LecturerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: AppColor.mainBlue,
            child: Row(
           children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Image(image: AssetImage("assets/atulogo.png")),
            ),
            Column(
              children: [
                Container(child: Text("SIM")),
                Container(child: Text("Lecturer Admin")),
              ],
            )
           ],
            ),

          )
        ],
      ),
    );
  }
}