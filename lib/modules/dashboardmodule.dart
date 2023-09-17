import 'package:flutter/material.dart';

class DashboardCard {
  final String title;
  final IconData cardIcon;

  final Color cardColor;
  final Widget navigate;

  DashboardCard(
      {
        required this.navigate,
        required this.title,
      required this.cardIcon,
     
      required this.cardColor});
}
