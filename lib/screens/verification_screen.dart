import 'package:flutter/material.dart';
import '../common/color_constants.dart';
// import 'package:flutter/gestures.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Verification extends StatefulWidget {
  static const String id = 'verify';
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
            title: Text('VERIFICATION',
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
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 35, right: 35, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Check your email',
                        style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: size.height * 0.035,
                      ),
                      Text(
                        'We sent a code your email',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 60,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                color: ColorConstants.kBackgroundColor,
                              ),
                              child: TextField(
                                style: TextStyle(fontSize: 22),
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: ColorConstants.kAccentColor,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color: ColorConstants.kAccentColor)),
                                  focusColor: ColorConstants.kAccentColor,
                                ),
                              )),
                          Container(
                            height: 60,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: ColorConstants.kBackgroundColor,
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 22),
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorConstants.kAccentColor,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color: ColorConstants.kAccentColor)),
                                focusColor: ColorConstants.kAccentColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: ColorConstants.kBackgroundColor,
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 22),
                              maxLines: 1,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorConstants.kAccentColor,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color: ColorConstants.kAccentColor)),
                                focusColor: ColorConstants.kAccentColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              color: ColorConstants.kBackgroundColor,
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 22),
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorConstants.kAccentColor,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.5,
                                        color: ColorConstants.kAccentColor)),
                                focusColor: ColorConstants.kAccentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      RichText(
                        text: TextSpan(
                          text: 'Code expires in: ',
                          style: TextStyle(
                              color:
                                  ColorConstants.kBlackColor.withOpacity(0.60),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: '06:16',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900))
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: ColorConstants.kAccentColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: ColorConstants.kAccentColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Change Email',
                          style: TextStyle(
                            color: ColorConstants.kAccentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
