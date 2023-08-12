// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simbackend/utils/colors.dart';

import '../sidebaritem.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Adjust the width of the sidebar as needed
      color: AppColor.mainBlue, // Sidebar background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SizedBox(height: 20),
          Container(
            
            height: 100,
            width: 250,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          SizedBox(height: 20),
          ListView(
            shrinkWrap: true,
          
            children: [
                
              SideBarItem(
                  iconColor: Colors.white,
                  iconselect: FontAwesomeIcons.tachometerAlt,
                  itemname: "Dashboard"),
                    Divider(
              color: Colors.white,
            ),
              Container(
                padding: const EdgeInsets.all(15),
                child: ExpansionTile(
                  leading: Icon(
                    FontAwesomeIcons.graduationCap,
                    size: 25,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Assignment",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  children: const [
                    ListTile(
                      title: Text('Manage Assignment',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
                Divider(
              color: Colors.white,
            ),
              SideBarItem(
                  iconselect: FontAwesomeIcons.bullhorn,
                  itemname: "Announcements",
                  iconColor: Colors.white),
                    Divider(
              color: Colors.white,
            ),
              SideBarItem(
                  iconselect: FontAwesomeIcons.message,
                  itemname: "Message",
                  iconColor: Colors.white),
                    Divider(
              color: Colors.white,
            ),
              SideBarItem(
                  iconselect: FontAwesomeIcons.vectorSquare,
                  itemname: "Logout",
                  iconColor: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
