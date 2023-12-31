// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_field, prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/text.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsDescriptionController = TextEditingController();
  TextEditingController file = TextEditingController();
  TextEditingController idcontroller = TextEditingController();

  final storageRef = FirebaseStorage.instance.ref();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedFileName = "Attach File";
  String? filename;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;
  //News data fetch

  final _newsCollection = FirebaseDatabase.instance.ref('Announcements');

  deleteMessage(key) {
    _newsCollection.child(key).remove();
  }

  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Announcements');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              actions: [
                Center(
                  child: Text(
                    "Lecturer Announcement",
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.btnBlue),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
              ],
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back)),
              backgroundColor: Colors.white,
            ),
            preferredSize: const Size.fromHeight(60)),
        body: SafeArea(
          child: Scrollbar(
            child: StreamBuilder(
                stream: _newsCollection.onValue,
                builder: (context, snapShot) {
                  if (snapShot.hasData &&
                      !snapShot.hasError &&
                      snapShot.data?.snapshot.value != null) {
                    Map _newsCollections = snapShot.data?.snapshot.value as Map;
                    List _newsItems = [];
                    _newsCollections.forEach((index, data) =>
                        _newsItems.add({"key": index, ...data}));

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _newsItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                              child: Container(
                                color: AppColors.cardYellow,
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Text(
                                  _newsItems[index]['announcementId'],
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          trailing: GestureDetector(
                            onTap: () async {
                              await deleteMessage(_newsItems[index]['key']);

                              Fluttertoast.showToast(
                                  msg: "Announcement Deleted!!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black45,
                                  textColor: Colors.white,
                                  fontSize: 15.0);
                            },
                            child: Icon(
                              FontAwesomeIcons.trashCan,
                              size: 18,
                              color: AppColors.btnBlue,
                              weight: 3,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          title: Text(_newsItems[index]['title'],
                              style: GoogleFonts.poppins(
                                  textStyle: headerboldblue2)),
                          subtitle: Text(_newsItems[index]['description'],
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  textStyle: TextStyle())),
                        );
                      },
                    );
                  }
                  return Center(
                    child: SingleChildScrollView(),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            isExtended: true,
            elevation: 6,
            child: Icon(Icons.add, color: Colors.white, size: 25, fill: 1.0),
            backgroundColor: AppColors.btnBlue,
            onPressed: () {
              Get.bottomSheet(
                  elevation: 5.0,
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Make Annoucement",
                          style: GoogleFonts.poppins(
                            textStyle: headerboldblue2,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Create Annoucement Id',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    autocorrect: true,
                                    maxLength: 3,
                                    controller: idcontroller,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1.5)),
                                        hintText: 'Create Id ',
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  controller: newsTitleController,
                                  decoration: InputDecoration(
                                    hintText: 'Create title',
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Detail',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  controller: newsDescriptionController,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: 'Add description',
                                  ),
                                ),
                                SizedBox(height: 14),
                                GestureDetector(
                                  onTap: () {
                                    Map<String, String> news = {
                                      'announcementId': idcontroller.text,
                                      'title': newsTitleController.text,
                                      'description':
                                          newsDescriptionController.text,
                                    };

                                    dbRef?.push().set(news).then((_) {
                                      idcontroller.text = "";
                                      newsTitleController.text = "";
                                      newsDescriptionController.text = "";
                                    }).catchError((_) {});
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Center(
                                      child: Text(
                                        "Make Announcement",
                                        style: GoogleFonts.montserrat(
                                            textStyle: subheaderBoldbtnwhite),
                                      ),
                                    ),
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: AppColors.cardBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
