import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sponsorHumanity/models/user.dart';
import 'package:sponsorHumanity/screens/home_screen.dart';
import 'package:sponsorHumanity/screens/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'wrapper';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return WelcomeScreen();
    } else {
      return HomeScreen();
    }
  }
}
