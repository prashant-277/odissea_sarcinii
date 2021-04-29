import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/constants.dart';

class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  bool rememberMe = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameEmail_controller = TextEditingController();
  TextEditingController _pswdCtrl = TextEditingController();
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
                              parametersValidate: "Please enter Email/User Name",
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
                                  side: BorderSide(color: Colors.grey, width: 2),
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
                          }
                        })),
                    Text("")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
