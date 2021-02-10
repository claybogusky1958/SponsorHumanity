import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';

class TextFields extends StatelessWidget {
  final String Function(String) validator;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextStyle errorStyle;
  final bool autofocus;
  final Function(String) onChanged;
  final Widget suffixIcon;

  TextFields({
    Key key,
    this.validator,
    this.labelText,
    this.keyboardType,
    this.onChanged,
    this.errorStyle,
    this.autofocus = false,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(color: ColorConstants.kAccentColor, fontSize: 12),
        obscureText: obscureText,
        autofocus: autofocus,
        autocorrect: false,
        keyboardType: keyboardType,
        cursorColor: ColorConstants.kAccentColor,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: ColorConstants.ktextColor, fontSize: 13),
          labelText: labelText,
          // errorText: "Incorrrect Email?",
          errorStyle: errorStyle ?? TextStyle(height: 0),
          // errorStyle: TextStyle(
          //     color: Colors.redAccent, fontSize: 11),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.red)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1.5,
          )),
          suffixIcon: suffixIcon,
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: ColorConstants.kAccentColor)),
          focusColor: ColorConstants.kAccentColor,
          // filled: true,
        ),
      ),
    );
  }
}
