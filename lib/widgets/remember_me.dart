import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sponsorHumanity/common/color_constants.dart';

class RememberMe extends StatefulWidget {
  @override
  _RememberMeState createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool _remember = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _remember = !_remember;
        });
      },
      child: Row(
        children: [
          Icon(
            _remember
                ? LineAwesomeIcons.check_square
                : Icons.check_box_outline_blank_sharp,
            color: ColorConstants.kAccentColor,
            size: 24,
          ),
          SizedBox(
            width: size.width * 0.007,
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              color: _remember
                  ? ColorConstants.kAccentColor
                  : ColorConstants.ktextColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
