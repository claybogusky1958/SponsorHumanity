import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:sponsorHumanity/screens/forgotpass_screen.dart';
import 'package:sponsorHumanity/screens/signup_screen.dart';
import 'package:sponsorHumanity/screens/verification_screen.dart';
import 'package:sponsorHumanity/widgets/shared/have_an_account.dart';
import 'package:sponsorHumanity/widgets/shared/or_divider.dart';
import 'package:sponsorHumanity/widgets/remember_me.dart';
import 'package:sponsorHumanity/widgets/shared/social_media_buttons.dart';
import 'package:sponsorHumanity/widgets/shared/terms_and_conditions.dart';
import 'package:sponsorHumanity/widgets/shared/text_fields.dart';
import '../common/color_constants.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'signin';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _viewPassword = true;

  TextEditingController _emailController;
  TextEditingController _passwordController;

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
            title: Text('WELCOME BACK',
                style: TextStyle(
                    color: ColorConstants.kAccentColor, fontSize: 18)),
            leading: Container(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello There!',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                            color: ColorConstants.kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: size.height * 0.009),
                      HaveAnAccount(
                        question: 'Don\'t have an account?',
                        text: 'Sign Up',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      TextFields(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                      ),
                      SizedBox(height: size.height * 0.005),
                      TextFields(
                        controller: _passwordController,
                        obscureText: _viewPassword,
                        keyboardType: TextInputType.text,
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: _viewPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          iconSize: 16,
                          onPressed: () {
                            setState(() {
                              _viewPassword = !_viewPassword;
                            });
                          },
                          color: ColorConstants.kAccentColor,
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RememberMe(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ForgotPassword.id);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: ColorConstants.kAccentColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.025),
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
                              Navigator.pushNamed(context, Verification.id);
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: ColorConstants.kwhiteColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.035),
                      OrDivider(text: 'Or sign in with'),
                      SizedBox(height: size.height * 0.015),
                      SocialMediaButtons(),
                      SizedBox(height: size.height * 0.04),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Use App anonymously to offer support',
                          style: TextStyle(
                              color: ColorConstants.kAccentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      SizedBox(height: size.height * 0.12),
                      TermsAndCondition(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
