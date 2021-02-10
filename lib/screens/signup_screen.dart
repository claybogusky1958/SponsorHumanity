import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sponsorHumanity/common/color_constants.dart';
import 'package:sponsorHumanity/screens/signin_screen.dart';
import 'package:sponsorHumanity/services/auth.dart';
import 'package:sponsorHumanity/widgets/shared/have_an_account.dart';
import 'package:sponsorHumanity/widgets/shared/or_divider.dart';
import 'package:sponsorHumanity/widgets/shared/social_media_buttons.dart';
import 'package:sponsorHumanity/widgets/shared/terms_and_conditions.dart';
// import 'package:sponsorHumanity/widgets/text_field.dart';
import 'package:sponsorHumanity/widgets/shared/text_fields.dart';
import 'package:sponsorHumanity/utilities/show_toast.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _viewPassword = true;
  bool _viewPassword2 = true;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _phone = "";

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
            title: Text('JOIN OUR COMMUNITY!',
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
                //
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
                        'Sign up to continue',
                        style: TextStyle(
                            color: ColorConstants.kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: size.height * 0.009),
                      HaveAnAccount(
                        question: 'Already have an account?',
                        text: 'Sign In',
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.id);
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            TextFields(
                              onChanged: (value) {
                                setState(() => _email = value);
                              },
                              validator: (value) => value.isEmpty ? "" : null,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Email',
                            ),
                            SizedBox(height: size.height * 0.005),
                            TextFields(
                              onChanged: (value) {
                                setState(() => _phone = value);
                              },
                              validator: (value) => value.isEmpty ? "" : null,
                              keyboardType: TextInputType.number,
                              labelText: 'Phone Number',
                            ),
                            SizedBox(height: size.height * 0.005),
                            TextFields(
                              onChanged: (value) {
                                setState(() => _password = value);
                              },
                              validator: (value) => value.isEmpty ? "" : null,
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
                            SizedBox(height: size.height * 0.005),
                            TextFields(
                              onChanged: (value) {
                                setState(() => _confirmPassword = value);
                              },
                              validator: (value) => value.isEmpty ? "" : null,
                              obscureText: _viewPassword2,
                              keyboardType: TextInputType.text,
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                icon: _viewPassword2
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                iconSize: 16,
                                onPressed: () {
                                  setState(() {
                                    _viewPassword2 = !_viewPassword2;
                                  });
                                },
                                color: ColorConstants.kAccentColor,
                              ),
                            ),
                          ])),
                      SizedBox(height: size.height * 0.04),
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
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic credential = await _auth
                                    .registerWithEmail(_email, _password);
                                if (credential == null) {
                                  setState(() => loading = false);
                                  showToast(
                                      'Please Check Your Internet Connection');
                                } else {
                                  Navigator.pushNamed(context, SignInScreen.id);
                                }
                              } else {
                                setState(() => loading = false);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                loading
                                    ? Row(children: [
                                        SpinKitCircle(
                                          color: ColorConstants.kwhiteColor,
                                          size: 22,
                                        ),
                                        SizedBox(width: size.width * 0.03),
                                      ])
                                    : Container(),
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorConstants.kwhiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.035),
                      OrDivider(text: 'Or sign up with'),
                      SizedBox(height: size.height * 0.015),
                      SocialMediaButtons(),
                      SizedBox(height: size.height * 0.08),
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
