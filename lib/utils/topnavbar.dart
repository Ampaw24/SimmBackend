import 'package:flutter/material.dart';

import '../screens/lectureview/lecturedashboard.dart';
import 'colors.dart';
import 'imagerow.dart';
class TopNavBar extends StatelessWidget {
  const TopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: AppColor.mainBlue,
      child: Row(
        children: [
          ImageRowText(),
          Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Icon(
              Icons.message,
              color: AppColor.mainBlue,
            )),
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.notifications, color: AppColor.mainBlue),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.only(right: 50),
            padding: const EdgeInsets.all(10),
            width: 170,
            height: 60,
            child: ProfileDetail(),
          ),
        ],
      ),
    );
  }
}
