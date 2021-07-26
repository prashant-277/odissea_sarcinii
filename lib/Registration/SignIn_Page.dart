import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Dashboard_Page.dart';
import 'package:odiseea_sarcinii/Tabs/Home_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:page_transition/page_transition.dart';

class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  bool rememberMe = false;
  final url1 = url.basicUrl;

  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameEmail_controller = TextEditingController(text: "test@gmail.com");
  TextEditingController _pswdCtrl = TextEditingController(text: "000000");

  String email = '';
  String password = '';

  bool show = true;

  void onTap() {
    show = !show;
    setState(() {});
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        if (rememberMe) {
          print("Remember");
        } else {
          print("Not Remember");
        }
      });

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "Assets/Images/background_crop.png",
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 20,
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "Assets/Icons/back.png",
                        height: 15,
                        color: kwhite,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.0,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Row(
                          children: [
                            Text(
                              "Sing In",
                              style: TextStyle(
                                  color: kblack,
                                  fontSize: 24,
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              child: textfield(
                                controller: usernameEmail_controller,
                                obscureText: false,
                                hintText: "Email/user name",
                                functionValidate: commonValidation,
                                suffixIcon: null,
                                prefixIcon: new IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/user.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: kblack,
                                  ),
                                  onPressed: null,
                                ),
                                parametersValidate:
                                    "Please enter Email/User Name",
                                textInputType: TextInputType.name,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              child: textfield(
                                controller: _pswdCtrl,
                                obscureText: show,
                                hintText: "Password",
                                functionValidate: commonValidation,
                                suffixIcon: IconButton(
                                  color: Colors.grey,
                                  icon: !show
                                      ? Image.asset(
                                          'Assets/Icons/visible.png',
                                          width: 25.0,
                                          height: 25.0,
                                        )
                                      : Image.asset(
                                          'Assets/Icons/invisible.png',
                                          width: 25.0,
                                          height: 25.0,
                                        ),
                                  onPressed: () {
                                    onTap();
                                  },
                                ),
                                prefixIcon: IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/password.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: kblack,
                                  ),
                                  onPressed: null,
                                ),
                                parametersValidate: "Please enter Password",
                                textInputType: TextInputType.name,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    side: BorderSide(
                                        color: Colors.grey, width: 2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    value: rememberMe,
                                    onChanged: _onRememberMeChanged,
                                    activeColor: buttonColor,
                                  ),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: primarybutton("Sign In", () {
                            if (_formKey.currentState.validate()) {
                              print("done");
                              login();
                            }
                          })),
                      Text("")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/login";

    var map = new Map<String, dynamic>();
    map["email"] = usernameEmail_controller.text.toString();
    map["password"] = _pswdCtrl.text.toString();
    map["fcm_token"] = prefs.getString("fcmToken").toString();

    final response = await http.post(Uri.parse(url), body: map);

    final responseJson = json.decode(response.body);
    print(responseJson.toString());

    if (responseJson["status"].toString() == "Success") {
      prefs.setString("userEmail", responseJson["data"]["email"].toString());
      prefs.setString("apiToken", responseJson["data"]["api_token"].toString());

      displayToast(responseJson["message"].toString());

      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              alignment: Alignment.bottomCenter,
              duration: Duration(milliseconds: 300),
              child: Dashboard_Page()));
    } else {
      displayToast(responseJson["message"].toString());
    }
  }
}
