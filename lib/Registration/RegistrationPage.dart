import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Dashboard_Page.dart';
import 'package:odiseea_sarcinii/Registration/ForgotPassword_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignUp_Page.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Image.network(
                  "https://play-lh.googleusercontent.com/Rud6GixIU_jQGGVaJm8Lsl1bas6hayDnTQRPg3mrXLFgQ0Cnl3MHM6XyltCctAB_iRM=s180-rw"),
              Text(
                "Odiseea Sarcinii",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp_Page()));
                    },
                    child: Text(
                      "Sign UP",
                      style: TextStyle(color: Colors.purple),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignIn_Page()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.purple),
                    ),
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 35,
                color: Colors.indigo,
                child: FlatButton(
                  color: Colors.indigo,
                  onPressed: () {
                    initiateFacebookLogin();
                  },
                  child: Text(
                    "Log In with Facebook",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                color: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword_Page()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard_Page()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        "Skip",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
            ],
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
