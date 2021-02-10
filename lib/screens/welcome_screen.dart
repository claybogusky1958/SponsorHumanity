import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:sponsorHumanity/screens/signin_screen.dart';
import 'package:sponsorHumanity/screens/signup_screen.dart';
import 'package:sponsorHumanity/widgets/shared/or_divider.dart';
import 'package:sponsorHumanity/widgets/shared/social_media_buttons.dart';
import 'package:sponsorHumanity/widgets/shared/terms_and_conditions.dart';
import 'package:sponsorHumanity/widgets/shared/use_app_anonymously.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: ColorConstants.kwhiteColor,
          body: Padding(
            padding: EdgeInsets.only(left: 35, right: 35, top: 35),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.53,
                    child: Image.asset('assets/images/SponsorHumanityLogo.jpg',
                        scale: 0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width / 2.6,
                        decoration: BoxDecoration(
                          color: ColorConstants.kAccentColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignInScreen.id);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: ColorConstants.kwhiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width / 2.6,
                        decoration: BoxDecoration(
                          color: ColorConstants.kAccentColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.id);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: ColorConstants.kwhiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.015),
                  OrDivider(text: 'Or sign in with'),
                  SizedBox(height: size.height * 0.015),
                  SocialMediaButtons(),
                  SizedBox(height: size.height * 0.04),
                  Anonymous(),
                  SizedBox(height: size.height * 0.08),
                  TermsAndCondition(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
