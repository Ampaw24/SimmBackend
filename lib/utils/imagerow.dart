import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/text.dart';
class ImageRowText extends StatelessWidget {
  const ImageRowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(left: 10),
          child: Image(image: AssetImage("assets/dashboardlogo.png")),
        ),
        ],
    );
  }
}
