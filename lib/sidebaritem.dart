import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBarItem extends StatelessWidget {
  final String itemname;
  final IconData iconselect;
  final Color iconColor;

  const SideBarItem({required this.iconselect, required this.itemname,required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        onTap: () {},
        leading: Icon(size: 25, iconselect, color: iconColor),
        title: Text(itemname, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
