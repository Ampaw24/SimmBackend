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
  final _lecturerCollection = FirebaseDatabase.instance.ref('Lecturers');
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Lecturers');
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
            )),
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
                            trailing: IconButton(
                                color: Colors.redAccent,
                                onPressed: () {},
                                icon: Icon(Icons.delete)),
                            leading: ClipRRect(
                                child: Image.asset('assets/user.png')),
                            title: Text(_userItems[index]['LecturerName']),
                            subtitle: Text(_userItems[index]['Course-Lecture']),
                            onTap: () {
                              print(
                                  'Tapped on message: ${messages[index].message}');
                            }),
                      );
                    });
              }
              return Container();
            }));
  }
}
