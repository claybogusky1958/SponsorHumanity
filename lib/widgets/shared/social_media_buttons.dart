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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: ColorConstants.kgreyColor.withOpacity(0.4),
              ),
              child: Image.asset(
                'assets/images/google-logo.png',
                scale: 1.2,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: ColorConstants.kgreyColor.withOpacity(0.4),
              ),
              child: Image.asset(
                'assets/images/facebook-logo.png',
                scale: 0.85,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
