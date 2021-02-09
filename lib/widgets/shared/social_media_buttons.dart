import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';

class SocialMediaButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      height: 60,
      width: size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50, width: 50, color: ColorConstants.kgreyColor),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50, width: 50, color: ColorConstants.kgreyColor),
          )
        ],
      ),
    ));
  }
}
