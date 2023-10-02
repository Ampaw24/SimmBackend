// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/screens/department/departmentlogin.dart';
import 'package:simbackend/widget/draweritem.dart';

class NavDrawer extends StatefulWidget {
  final String mail;
  NavDrawer({required this.mail});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 254,
      height: 673.2,
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Color.fromARGB(47, 158, 158, 158),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 700,
                    height: 187,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Color.fromARGB(25, 158, 158, 158)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/atulogo.png',
                          width: 300,
                          height: 110,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(widget.mail.trim(),
                            style: GoogleFonts.montserrat(
                                fontSize: 10, fontWeight: FontWeight.w400)),
                        Text('Student Info Manager',
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 700,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(25, 158, 158, 158)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        DrawerItem(
                          name: 'Edit Profile',
                          icon: Icons.edit,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DrawerItem(
                          name: 'Reports',
                          icon: Icons.report,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DrawerItem(
                            name: 'Annoucements',
                            icon: Icons.newspaper,
                            onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        DrawerItem(
                            name: 'Alert',
                            icon: Icons.notifications_active,
                            onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 700,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(25, 158, 158, 158)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        DrawerItem(
                          name: 'Logout',
                          icon: Icons.login_rounded,
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Get.to(DepartmentLogin(),
                                transition: Transition.circularReveal);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        break;
    }
  }

  Widget headerWidget() {
    return Container(
      width: 300,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/CSA.png"),
          ),
          SizedBox(
            width: 10,
          ),
          Text('GDPR',
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 226, 9, 9)))
        ],
      ),
    );
  }
}
