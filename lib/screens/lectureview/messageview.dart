// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:readmore/readmore.dart';
import '../../modules/messagemodeule.dart';
import 'package:firebase_database/firebase_database.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
 
  final _complaintCollection = FirebaseDatabase.instance.ref('Complaints');
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Complaints');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Students Messages",
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.btnBlue),
            ),
          )),
      body: StreamBuilder(
          stream: _complaintCollection.onValue,
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.mail,
                                color: Colors.white,
                              )),
                          title: Text(
                            "STUDENT COMPLAINT",
                          ),
                          subtitle: ReadMoreText(
                            "Address: ${_userItems[index]['address']} \n Message: ${_userItems[index]['text']}",
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

                        
                        ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
