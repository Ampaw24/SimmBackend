// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../../modules/messagemodeule.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  final _assignmentCollection = FirebaseDatabase.instance.ref('Assignment');
  bool isLoading = false;
  deleteMessage(key) {
    _assignmentCollection.child(key).remove();
  }

  DatabaseReference? dbRef;
  int? _reportCount;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Assignment');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: _assignmentCollection.onValue,
          builder: (context, snapShot) {
            if (snapShot.hasData &&
                !snapShot.hasError &&
                snapShot.data?.snapshot.value != null) {
              Map _reportCollections = snapShot.data?.snapshot.value as Map;
              List _assItems = [];

              _reportCollections.forEach(
                  (index, data) => _assItems.add({"key": index, ...data}));

              return ListView.builder(
                  itemCount: _assItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                          trailing: GestureDetector(
                            child: Icon(
                              Icons.delete,
                              color: AppColor.cardRed,
                            ),
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
                          title: Text(_assItems[index]['title']),
                          subtitle: Text(
                              "Submission: ${_assItems[index]['submission-date']} "),
                          onTap: () {
                            deleteMessage(_assItems[index]['key']);
                          }),
                    );
                  });
            }
            return Center(
              child: SingleChildScrollView(),
            );
          }),
    );
  }
}
