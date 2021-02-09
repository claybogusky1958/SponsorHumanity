import 'package:flutter/material.dart';
import '../../common/color_constants.dart';

class HaveAnAccount extends StatelessWidget {
  final String text;
  final String question;
  final Function onTap;

  const HaveAnAccount({Key key, this.text, this.question, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          question + ' ',
          style: TextStyle(
              color: ColorConstants.kBlackColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(text,
              style: TextStyle(
                  color: ColorConstants.kAccentColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
