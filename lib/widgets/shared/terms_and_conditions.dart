import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';

class TermsAndCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'By Joining Sponsor Humanity, you agree to our ',
          style: TextStyle(
              color: ColorConstants.kBlackColor,
              fontSize: 9,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {},
                text: 'Terms & Conditions',
                style: TextStyle(
                    color: ColorConstants.kAccentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
