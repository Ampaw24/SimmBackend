// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simbackend/screens/department/lecturer/managelecturer.dart';
import '../../../core/colors.dart';
import 'addlecturer.dart';

class BTMnav extends StatefulWidget {
  const BTMnav({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;
  @override
  State<BTMnav> createState() => _BTMnavState();
}

class _BTMnavState extends State<BTMnav> {
  final pages = [
    LecturerForm(),
    ManageLecturer(),
  ];
  int _pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 130, 191, 241),
            labelTextStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
            indicatorShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        child: NavigationBar(
            height: 63,
            backgroundColor: AppColors.cardBlue,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            animationDuration: Duration(seconds: 1),
            selectedIndex: _pageIndex,
            onDestinationSelected: (pageIndex) =>
                setState(() => _pageIndex = pageIndex),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  size: 15,
                  FontAwesomeIcons.chalkboardUser,
                  color: Colors.white,
                ),
                selectedIcon: Icon(
                  size: 15,
                  FontAwesomeIcons.chalkboardUser,
                  color: Colors.black,
                ),
                label: 'Add Lec',
              ),
              NavigationDestination(
                icon: Icon(
                  size: 15,
                  FontAwesomeIcons.barsProgress,
                  color: Colors.white,
                ),
                selectedIcon: Icon(
                  size: 15,
                  FontAwesomeIcons.barsProgress,
                  color: Colors.black,
                ),
                label: 'Manage',
              ),
            ]),
      ),
    );
  }
}
