import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sponsorHumanity/models/user.dart';
import 'package:sponsorHumanity/screens/forgotpass_screen.dart';
import 'package:sponsorHumanity/screens/home_screen.dart';
import 'package:sponsorHumanity/screens/resetpass_screen.dart';
import 'package:sponsorHumanity/screens/signin_screen.dart';
import 'package:sponsorHumanity/screens/splash_screen.dart';
import 'package:sponsorHumanity/screens/verification_screen.dart';
import 'package:sponsorHumanity/screens/welcome_screen.dart';
import 'package:sponsorHumanity/screens/signup_screen.dart';
import 'package:sponsorHumanity/services/auth.dart';
import 'package:sponsorHumanity/utilities/wrapper.dart';
import './common/color_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sponsor Humanity',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: ColorConstants.kBackgroundColor,
      ),
      initialRoute: Wrapper.id,
      routes: {
        Wrapper.id: (context) => StreamProvider<AppUser>.value(
            value: AuthService().user, child: Wrapper()),
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
        ResetPassword.id: (context) => ResetPassword(),
        Verification.id: (context) => Verification(),
      },
    );
  }
}
