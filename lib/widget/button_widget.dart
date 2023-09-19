import 'package:flutter/material.dart';
import 'package:simbackend/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor.btnBlue,
          minimumSize: Size.fromHeight(40),
        ),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      );
}
