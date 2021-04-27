import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Dashboard_Page.dart';
import 'package:odiseea_sarcinii/Registration/ForgotPassword_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignUp_Page.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isLoggedIn = false;
  var profileData;
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kwhite,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "Assets/Images/background_crop.png",
                  fit: BoxFit.fill,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: primarybutton(
                          "Sign Up",
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp_Page()));
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,

                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                          color: kwhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                  color: buttonColor,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn_Page()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: kblack,
                                fontSize: 16,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Color(0xff3B5998),
                    onPressed: () {
                      initiateFacebookLogin();
                    },
                    child: Text(
                      "Log In with Facebook",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 16,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: FlatButton(
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword_Page()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 16,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard_Page()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Skip  ",
                        style: TextStyle(
                            color: kblack,
                            fontSize: 18,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kblack,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> initiateFacebookLogin() async {
    final facebookLoginResult = await facebookSignIn.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}'));

        var profile = json.decode(graphResponse.body);

        print("profile******* " + profile.toString());
        print("user Id +++++ " + profile["id"].toString());

        onLoginStatusChanged(true, profileData: profile);
        print(facebookLoginResult.accessToken.token);

        var graphResponse1 = await http.get(
          Uri.parse(
              "https://graph.facebook.com/v10.0/884006802393345/permission?access_token=${facebookLoginResult.accessToken.token}"),
        );

        var profile1 = json.decode(graphResponse1.body);

        print("Friend List ******* " + profile1.toString());

        break;
    }
  }
}
