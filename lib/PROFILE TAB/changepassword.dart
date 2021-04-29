import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/constants.dart';

class changepassword extends StatefulWidget {
  @override
  _changepasswordState createState() => _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  final _formKey = GlobalKey<FormState>();

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
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
              "",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Change password",
                    style: TextStyle(
                        color: kblack,
                        fontSize: 25,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Container(
                child: Column(
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: primarybutton("Change", () {
                    if (_formKey.currentState.validate()) {
                      print("done");
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}
