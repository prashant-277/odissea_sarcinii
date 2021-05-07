import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Dashboard_Page.dart';
import 'package:odiseea_sarcinii/Registration/ForgotPassword_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignUp_Page.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isLoggedIn = false;
  var profileData;
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  var device_token;
  var device_id;

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  @override
  void initState() {
    super.initState();

    firebaseCloudMessaging_Listeners();
    getDeviceId();
    checkIsLogin();
  }

  Future<void> firebaseCloudMessaging_Listeners() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (Platform.isIOS) iOS_Permission();
    if (Platform.isAndroid) Android_Permission();

    _firebaseMessaging.getToken().then((token) {
      setState(() {
        device_token = token;
        print("fcm token  " + device_token);
        prefs.setString("fcmToken", device_token.toString());
      });
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void Android_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  Future<String> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;

      print("Device id---------" + iosDeviceInfo.identifierForVendor);

      setState(() {
        device_id = iosDeviceInfo.identifierForVendor;
        prefs.setString("deviceId", device_id);
      });
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print("Device id---------" + androidDeviceInfo.androidId.toString());

      setState(() {
        device_id = androidDeviceInfo.androidId;
        prefs.setString("deviceId", device_id);
      });
      return androidDeviceInfo.androidId; // unique ID on Android

    }
  }

  Future<void> checkIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("userEmail") != null) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              child: Dashboard_Page()));
    } else {}
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
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    child: SignUp_Page()));
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
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    alignment: Alignment.bottomCenter,
                                    duration: Duration(milliseconds: 300),
                                    child: SignIn_Page()));
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
                          PageTransition(
                              type: PageTransitionType.fade,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 300),
                              child: ForgotPassword_Page()));
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
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 300),
                            child: Dashboard_Page()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Skip  ",
                        style: TextStyle(
                            color: kblack,
                            fontSize: 20,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset(
                        "Assets/Icons/right_single.png",
                        height: 15,
                      )
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

        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 300),
                child: Dashboard_Page()));

        break;
    }
  }
}
