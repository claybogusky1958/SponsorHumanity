import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:sponsorHumanity/services/auth.dart';
import 'package:sponsorHumanity/utilities/show_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Anonymous extends StatefulWidget {
  @override
  _AnonymousState createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {
  final AuthService _auth = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        dynamic result = await _auth.signInAnon();
        if (result == null) {
          setState(() {
            loading = false;
          });
          showToast('Couldn\'t Login, Check Internet Connectivity ');
        } else {
          showToast('Logged In Successfully');
        }
      },
      child: Row(
        children: [
          Text(
            'Use App anonymously to offer support',
            style: TextStyle(
                color: ColorConstants.kAccentColor,
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
          SizedBox(width: size.width * 0.03),
          loading
              ? SpinKitCircle(
                  color: ColorConstants.kAccentColor,
                  size: 20,
                )
              : Container()
        ],
      ),
    );
  }
}
