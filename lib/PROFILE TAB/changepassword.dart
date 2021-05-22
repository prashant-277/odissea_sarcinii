import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/Registration/RegistrationPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';

class changepassword extends StatefulWidget {
  @override
  _changepasswordState createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  final _formKey = GlobalKey<FormState>();
  final url1 = url.basicUrl;

  TextEditingController _oldpswdCtrl = TextEditingController();
  TextEditingController _newpswdCtrl = TextEditingController();
  TextEditingController _confirmpswdCtrl = TextEditingController();
  String password = '';
  bool show = true;
  bool show1 = true;
  bool show2 = true;

  void onTap() {
    show = !show;
    setState(() {});
  }

  void onTap1() {
    show1 = !show1;
    setState(() {});
  }

  void onTap2() {
    show2 = !show2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kwhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(""),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "Assets/Icons/back.png",
                height: 15,
                color: kblack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Change password",
                style: TextStyle(
                    color: kblack,
                    fontSize: 25,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: textfield(
                        controller: _oldpswdCtrl,
                        textInputType: TextInputType.text,
                        functionValidate: commonValidation,
                        obscureText: show,
                        prefixIcon: new IconButton(
                          icon: new Image.asset(
                            'Assets/Icons/password.png',
                            width: 20.0,
                            height: 20.0,
                            color: buttonColor,
                          ),
                          onPressed: null,
                        ),
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
                        hintText: "Old Passwod",
                        parametersValidate: "Please enter old password",
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: textfield(
                          controller: _newpswdCtrl,
                          parametersValidate: "Please enter new password",
                          hintText: "New password",
                          obscureText: show1,
                          textInputType: TextInputType.text,
                          functionValidate: commonValidation,
                          prefixIcon: new IconButton(
                            icon: new Image.asset(
                              'Assets/Icons/password.png',
                              width: 20.0,
                              height: 20.0,
                              color: buttonColor,
                            ),
                            onPressed: null,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            icon: !show1
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
                              onTap1();
                            },
                          ),
                        )),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: textfield(
                        controller: _confirmpswdCtrl,
                        textInputType: TextInputType.text,
                        functionValidate: commonValidation,
                        obscureText: show2,
                        hintText: "Confirm password",
                        parametersValidate: "Please enter confirm password",
                        prefixIcon: new IconButton(
                          icon: new Image.asset(
                            'Assets/Icons/password.png',
                            width: 20.0,
                            height: 20.0,
                            color: buttonColor,
                          ),
                          onPressed: null,
                        ),
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: !show1
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
                            onTap2();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: primarybutton("Change", () async {
                          if (_formKey.currentState.validate()) {
                            if (_newpswdCtrl.text.toString() !=
                                _confirmpswdCtrl.text.toString()) {
                              displayToast("Your password is not matched");
                            } else {
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                              var url = "$url1/changePassword";

                              var map = new Map<String, dynamic>();
                              map["old_password"] =
                                  _oldpswdCtrl.text.toString(); //week.toString();
                              map["password"] =
                                  _newpswdCtrl.text.toString(); //week.toString();

                              Map<String, String> header = {
                                "Authorization":
                                prefs.getString("apiToken").toString()
                              };

                              final response =
                              await http.post(Uri.parse(url), headers: header, body: map);

                              final responseJson = json.decode(response.body);
                              print("ddddd" + responseJson.toString());
                              if (responseJson["status"] == "Success") {
                                displayToast(responseJson["message"].toString());
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => RegistrationPage()));
                              } else {
                                displayToast(responseJson["message"].toString());
                              }
                            }
                          }
                        })),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
