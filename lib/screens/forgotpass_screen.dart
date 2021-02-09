import 'package:flutter/material.dart';
import 'package:sponsorHumanity/screens/resetpass_screen.dart';
import 'package:sponsorHumanity/widgets/shared/have_an_account.dart';
import 'package:sponsorHumanity/widgets/shared/text_fields.dart';
import '../common/color_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController;
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Text(
                        'Enter your registered email address and we\'ll send you a code to reset your password',
                        style: TextStyle(
                            color: ColorConstants.ktextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: size.height * 0.04),
                      TextFields(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        autofocus: true,
                      ),
                      SizedBox(height: size.height * 0.05),
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
                            onPressed: () {
                              Navigator.of(context).pushNamed(ResetPassword.id);
                            },
                            child: Text(
                              'Send Code',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      HaveAnAccount(
                        question: 'Having Problems? ',
                        text: 'Contact Us',
                        onTap: () {},
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
