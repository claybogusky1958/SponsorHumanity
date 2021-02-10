import 'package:flutter/material.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sponsorHumanity/services/auth.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Welcome!',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: ColorConstants.kBlackColor),
          ),
          backgroundColor: ColorConstants.kBackgroundColor,
          actions: [
            FlatButton.icon(
              label: Text('Logout',
                  style: TextStyle(
                      color: ColorConstants.kAccentColor, fontSize: 14)),
              icon: Icon(
                LineAwesomeIcons.alternate_sign_out,
                color: ColorConstants.kAccentColor,
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        backgroundColor: ColorConstants.kBackgroundColor,
        body: Container(
          decoration: BoxDecoration(
              color: ColorConstants.kwhiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'What would you like to do?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    softWrap: true,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: size.width * 0.6,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        side: BorderSide(color: ColorConstants.kAccentColor)),
                    onPressed: () {},
                    padding: EdgeInsets.all(25.0),
                    color: Colors.green[700],
                    textColor: ColorConstants.kAccentColor,
                    child:
                        Text("Offer Support", style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: size.width * 0.6,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                        side: BorderSide(color: ColorConstants.kAccentColor)),
                    onPressed: () {},
                    padding: EdgeInsets.all(25.0),
                    color: Colors.blue,
                    textColor: ColorConstants.kAccentColor,
                    child:
                        Text("Request Support", style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
