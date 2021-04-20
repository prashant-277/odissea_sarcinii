import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  bool rememberMe = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailCtrl = TextEditingController();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    top: 40,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "Assets/Icons/back.png",
                        fit: BoxFit.fill,
                        height: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.15,
                child: Row(
                  children: [
                    Text(
                      "Sing In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700),
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
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller: _emailCtrl,
                          validator: (value) =>
                              value.isEmpty ? 'Please enter email' : null,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                          style: TextStyle(
                              fontFamily: "OpenSans", color: Colors.black),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(new RegExp(r" "))
                          ],
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: kGray, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: kGray, width: 1)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: kGray,
                                width: 1.0,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: "OpenSans",
                            ),
                            hintText: 'Email/User name',
                            prefixIcon: new IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/user.png',
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: TextFormField(
                          controller: _pswdCtrl,
                          textAlign: TextAlign.start,
                          validator: (value) =>
                              value.isEmpty ? 'Please enter password' : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                          style: TextStyle(
                              fontFamily: "OpenSans", color: Colors.black),
                          maxLines: 1,
                          obscureText: show,
                          decoration: InputDecoration(
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
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: kGray, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: kGray, width: 1)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: kGray,
                                width: 1.0,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontFamily: "OpenSans",
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            prefixIcon: new IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/password.png',
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              side: BorderSide(color: Colors.grey, width: 2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                  )),
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
      ),
    );
  }
}
