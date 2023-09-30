// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/modules/messagemodeule.dart';

class TimeTableHistory extends StatefulWidget {
  const TimeTableHistory({super.key});

  @override
  State<TimeTableHistory> createState() => _TimeTableHistoryState();
}

class _TimeTableHistoryState extends State<TimeTableHistory> {
  List<MessageModule> messages = [];
  final _lecturerCollection = FirebaseDatabase.instance.ref('TimeTable');
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('TimeTable');
  }

  deleteMessage(key) {
    _lecturerCollection.child(key).remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: _lecturerCollection.onValue,
            builder: (context, snapShot) {
              if (snapShot.hasData &&
                  !snapShot.hasError &&
                  snapShot.data?.snapshot.value != null) {
                Map _lecturerCollections = snapShot.data?.snapshot.value as Map;
                List _userItems = [];
                _lecturerCollections.forEach(
                    (index, data) => _userItems.add({"key": index, ...data}));

                return ListView.builder(
                    itemCount: _userItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 7,
                        color: Colors.white,
                        child: ListTile(
                            subtitle: ReadMoreText(
                              "Notice: ${_userItems[index]['description']}",
                              trimLines: 1,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'show more',
                              trimExpandedText: ' show less',
                              lessStyle: TextStyle(color: AppColor.btnBlue),
                              moreStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueAccent),
                            ),
                            trailing: IconButton(
                                color: Colors.redAccent,
                                onPressed: () {
                                  deleteMessage(_userItems[index]['key']);
                                },
                                icon: Icon(Icons.delete)),
                            leading:
                                ClipRRect(child: Icon(Icons.file_copy_rounded)),
                            title: Text(_userItems[index]['title']),
                            onTap: () {}),
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
