// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:simbackend/modules/messagemodeule.dart';

class ManageLecturer extends StatefulWidget {
  const ManageLecturer({super.key});

  @override
  State<ManageLecturer> createState() => _ManageLecturerState();
}

class _ManageLecturerState extends State<ManageLecturer> {
  List<MessageModule> messages = [];
  final _newsCollection = FirebaseDatabase.instance.ref('Announcements');
  DatabaseReference? dbRef;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Announcements');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Manage Lecturers",
                style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.btnBlue),
              ),
              leading: Container(),
            )),
        body: StreamBuilder(
            stream: _newsCollection.onValue,
            builder: (context, snapShot) {
              if (snapShot.hasData &&
                  !snapShot.hasError &&
                  snapShot.data?.snapshot.value != null) {
                Map _newsCollections = snapShot.data?.snapshot.value as Map;
                List _newsItems = [];
                _newsCollections.forEach(
                    (index, data) => _newsItems.add({"key": index, ...data}));
                return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                            // You can use an image here for the user profile picture
                            backgroundColor: Colors.blue,
                            child: Text(
                              messages[index]
                                  .userProfileImage, // Display the first letter of the username
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(_newsItems[index]['LecturerName']),
                          subtitle: Text(_newsItems[index]['LecturerName']),
                          onTap: () {
                            // Handle message tap action here
                            print(
                                'Tapped on message: ${messages[index].message}');
                          });
                    });
              }
              return Container();
            }));
  }
}
