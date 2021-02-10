import 'package:flutter/material.dart';
import 'package:sponsorHumanity/widgets/shared/have_an_account.dart';
import 'package:sponsorHumanity/widgets/shared/text_fields.dart';
import '../common/color_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'reset';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String _code = "";
  String _confirmPassword;
  String _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text('PASSWORD RECOVERY',
                style: TextStyle(
                    color: ColorConstants.kAccentColor, fontSize: 18)),
            leading: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: IconButton(
                  icon: Icon(
                    LineAwesomeIcons.alternate_long_arrow_left,
                    size: 22,
                  ),
                  color: ColorConstants.kAccentColor,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.kwhiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 35, right: 35, top: 10),
                //
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              color: ColorConstants.kAccentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: size.height * 0.035),
                      Text(
                        'A reset Code was sent to your email address. Enter the code below and create a new password.',
                        style: TextStyle(
                            color: ColorConstants.ktextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        //
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Reset Code',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFields(
                        onChanged: (value) {
                          setState(() => _code = value);
                        },
                        validator: (value) => value.isEmpty ? "Required" : null,
                        keyboardType: TextInputType.text,
                        labelText: 'Enter Code',
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'New Password',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFields(
                        onChanged: (value) {
                          setState(() => _password = value);
                        },
                        validator: (value) => value.isEmpty ? "Required" : null,
                        keyboardType: TextInputType.text,
                        labelText: 'Enter Password',
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextFields(
                        onChanged: (value) {
                          setState(() => _confirmPassword = value);
                        },
                        validator: (value) => value.isEmpty ? "Required" : null,
                        keyboardType: TextInputType.text,
                        labelText: 'Re-enter Password',
                      ),
                      SizedBox(height: size.height * 0.03),
                      Hero(
                        transitionOnUserGestures: true,
                        tag: 'buttons',
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorConstants.kAccentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                color: ColorConstants.kwhiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Center(
                        child: HaveAnAccount(
                          question: 'Didn\'t recieve the code?',
                          text: 'Resend Code',
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
