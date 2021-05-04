import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/Registration/otpConfirmPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword_Page extends StatefulWidget {
  @override
  _ForgotPassword_PageState createState() => _ForgotPassword_PageState();
}

class _ForgotPassword_PageState extends State<ForgotPassword_Page> {
  final _formKey = GlobalKey<FormState>();
  final url1 = url.basicUrl;

  TextEditingController _emailCtrl = TextEditingController();
  String email = '';

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
                      "Forgot password",
                      style: TextStyle(
                          color: kblack,
                          fontSize: 24,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 1.15,
                        child: Text(
                          "Enter your email address below and we will send you a reset link.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    controller: _emailCtrl,
                    validator: (value) =>
                        value.isEmpty ? 'Please enter email' : null,
                    style: TextStyle(fontFamily: "OpenSans", color: kblack),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(new RegExp(r" "))
                    ],
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      hintText: 'Email',
                      prefixIcon: new IconButton(
                        icon: new Image.asset(
                          'Assets/Icons/email.png',
                          color: buttonColor,
                          width: 20.0,
                          height: 20.0,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: primarybutton("Send", () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (_formKey.currentState.validate()) {
                      print("done");

                      var url = "$url1/forgotPassword";

                      var map = new Map<String, dynamic>();
                      map["email"] = _emailCtrl.text.toString();

                      final response = await http.post(url, body: map);

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
                                child: otpConfirmPage(
                                    responseJson["data"]["email"].toString(),
                                    responseJson["data"]["otp"].toString())));
                      } else {
                        displayToast(responseJson["message"].toString());
                      }
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
