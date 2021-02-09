import 'package:flutter/material.dart';
import 'package:sponsorHumanity/screens/forgotpass_screen.dart';
import 'package:sponsorHumanity/screens/home_screen.dart';
import 'package:sponsorHumanity/screens/resetpass_screen.dart';
import 'package:sponsorHumanity/screens/signin_screen.dart';
import 'package:sponsorHumanity/screens/splash_screen.dart';
import 'package:sponsorHumanity/screens/verification_screen.dart';
import 'package:sponsorHumanity/screens/welcome_screen.dart';
import 'package:sponsorHumanity/screens/signup_screen.dart';
import './common/color_constants.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sponsor Humanity',
    theme: ThemeData(
      fontFamily: 'Ubuntu',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorConstants.kBackgroundColor,
    ),
    initialRoute: SignInScreen.id,
    routes: {
      SplashScreen.id: (context) => SplashScreen(),
      WelcomeScreen.id: (context) => WelcomeScreen(),
      SignUpScreen.id: (context) => SignUpScreen(),
      SignInScreen.id: (context) => SignInScreen(),
      HomeScreen.id: (context) => HomeScreen(),
      ForgotPassword.id: (context) => ForgotPassword(),
      ResetPassword.id: (context) => ResetPassword(),
      Verification.id: (context) => Verification(),
    },
  ));
}
