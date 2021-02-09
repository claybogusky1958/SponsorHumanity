import 'package:flutter/material.dart';
import '../../common/color_constants.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              text,
              style: TextStyle(
                color: ColorConstants.kAccentColor,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: ColorConstants.kBlackColor,
        // height: 1.5,
        thickness: 1.5,
      ),
    );
  }
}
