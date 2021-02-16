import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:sponsorHumanity/services/auth.dart';
import 'package:sponsorHumanity/utilities/show_toast.dart';
import 'package:sponsorHumanity/widgets/shared/show_exception_alert_dialog.dart';

class SocialMediaButtons extends StatefulWidget {
  @override
  _SocialMediaButtonsState createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      height: 60,
      width: size.width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () async {
              try {
                await _auth.signInWithGoogle();
              } on FirebaseAuthException catch (e) {
                showExceptionAlertDialog(
                    context,
                    title: 'Sign in failed',
                    exception: e,
                  ); 
              }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: ColorConstants.kgreyColor.withOpacity(0.4),
              ),
              child: Image.asset(
                'assets/images/google-logo.png',
                scale: 1.2,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                await _auth.signInWithFacebook();
              } 
              catch (e) {
                showExceptionAlertDialog(
                    context,
                    title: 'Sign in failed',
                    exception: e,
                  );
              }
/*             changed 21 Feb 2021
              catch (e ) {
               showToast('Please Check Your Internet Connection');
              }
*/
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: ColorConstants.kgreyColor.withOpacity(0.4),
              ),
              child: Image.asset(
                'assets/images/facebook-logo.png',
                scale: 0.85,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
