// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../../modules/messagemodeule.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  List<MessageModule> messages = [
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
    MessageModule("assets/profile.jpg", "Mathematees", "I don't get you sir "),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 15),
              elevation: 5,
              color: Colors.white,
              child: ListTile(
                  trailing: Icon(
                    Icons.delete,
                    color: AppColor.cardRed,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: AppColor.btnBlue,
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(
                          Icons.file_open,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  title: Text(messages[index].userName),
                  subtitle: Text(messages[index].message),
                  onTap: () {
                    // Handle message tap action here
                    print('Tapped on message: ${messages[index].message}');
                  }),
            );
          }),
    );
  }
}
