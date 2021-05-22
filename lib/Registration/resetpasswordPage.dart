import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:odiseea_sarcinii/Registration/RegistrationPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';

class resetpasswordPage extends StatefulWidget {
  var email;

  resetpasswordPage(this.email);

  @override
  _resetpasswordPageState createState() => _resetpasswordPageState();
}

class _resetpasswordPageState extends State<resetpasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _pswdCtrl = TextEditingController();
  TextEditingController _confirmpswdCtrl = TextEditingController();
  final url1 = url.basicUrl;

  String email = '';

  String password = '';
  String conffirmpassword = '';

  bool show = true;
  bool confirmshow = true;

  void onTap() {
    show = !show;
    setState(() {});
  }

  void onTap1() {
    confirmshow = !confirmshow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        automaticallyImplyLeading: false,
        title: Text(""),
        leading: Center(
          child: IconButton(
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
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Reset password",
                      style: TextStyle(
                          color: kblack,
                          fontSize: 28,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: TextFormField(
                          controller: _pswdCtrl,
                          textAlign: TextAlign.start,
                          obscureText: show,
                          validator: (value) => value.isEmpty
                              ? 'Please enter new password'
                              : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                          style:
                              TextStyle(fontFamily: "OpenSans", color: kblack),
                          maxLines: 1,
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
                            fillColor: kwhite,
                            hintText: 'New password',
                            prefixIcon: new IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/password.png',
                                width: 20.0,
                                height: 20.0,
                                color: buttonColor,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: TextFormField(
                          controller: _confirmpswdCtrl,
                          textAlign: TextAlign.start,
                          obscureText: confirmshow,
                          validator: (value) => value.isEmpty
                              ? 'Please enter confirm password'
                              : null,
                          onChanged: (value) {
                            setState(() => conffirmpassword = value);
                          },
                          style:
                              TextStyle(fontFamily: "OpenSans", color: kblack),
                          maxLines: 1,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              color: Colors.grey,
                              icon: !confirmshow
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
                            fillColor: kwhite,
                            hintText: 'Confirm password',
                            prefixIcon: new IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/password.png',
                                width: 20.0,
                                height: 20.0,
                                color: buttonColor,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 25),
              Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: primarybutton("Reset", () async {
                    if (_formKey.currentState.validate() &&
                        _pswdCtrl.text == _confirmpswdCtrl.text) {


                      var url = "$url1/resetPassword";

                      var map = new Map<String, dynamic>();
                      map["email"] = widget.email.toString();
                      map["password"] = _pswdCtrl.text.toString();

                      final response = await http.post(Uri.parse(url), body: map);

                      final responseJson = json.decode(response.body);
                      print(responseJson.toString());
                      if (responseJson["status"].toString() == "Success") {

                        displayToast(responseJson["message"].toString());

                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(milliseconds: 300),
                                child: RegistrationPage()));

                      } else {
                        displayToast(responseJson["message"].toString());
                      }


                    }
                    if (_pswdCtrl.text.toString() !=
                        _confirmpswdCtrl.text.toString()) {
                      displayToast("Your password is not matched");
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
