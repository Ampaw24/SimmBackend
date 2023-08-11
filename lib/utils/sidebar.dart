// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:simbackend/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.mainBlueLight,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15)
        )
      ),
      width: 250.0,
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(FontAwesomeIcons.tachometerAlt, color: Colors.white),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
          ),
          Divider(color: Colors.white,),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
          ),
           Divider(color: Colors.white,),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}