import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      color: ColorConstants.kAccentColor,
    ));
  }
}
