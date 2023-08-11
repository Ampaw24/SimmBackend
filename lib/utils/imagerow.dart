// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
class ImageRowText extends StatelessWidget {
  const ImageRowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/dashboardlogo.png"),
              fit: BoxFit.cover)),

      // child: Image(image: AssetImage("assets/dashboardlogo.png")),
    );
  }
}
