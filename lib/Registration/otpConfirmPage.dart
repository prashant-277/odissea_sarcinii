import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/Registration/resetpasswordPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class otpConfirmPage extends StatefulWidget {
  var email, otp;

  otpConfirmPage(this.email, this.otp);

  @override
  _otpConfirmPageState createState() => _otpConfirmPageState();
}

class _otpConfirmPageState extends State<otpConfirmPage> {
  final url1 = url.basicUrl;
  var userotp;

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
                      "Confirm Account",
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
                          "We'll sent an email with 4-digit code to " + widget.email.toString(),
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.75,
                height: MediaQuery.of(context).size.height / 13,
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w500),
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.number,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                    setState(() {
                      userotp = pin;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: primarybutton("Confirm", () async {
                    var url = "$url1/otpVerify";

                    var map = new Map<String, dynamic>();
                    map["email"] = widget.email.toString();
                    map["otp"] = userotp.toString();

                    final response = await http.post(url, body: map);

                    final responseJson = json.decode(response.body);
                    print(responseJson.toString());
                    if (responseJson["status"].toString() == "Success" ||
                        widget.otp.toString() == userotp.toString()) {
                      displayToast(responseJson["message"].toString());

                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 300),
                              child: resetpasswordPage(widget.email.toString())));

                    } else {
                      displayToast(responseJson["message"].toString());
                    }


                  })),
              SizedBox(
                height: 25,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      text: "Don't get code? ",
                    ),
                    TextSpan(
                      style: TextStyle(
                          color: buttonColor,
                          fontFamily: "OpenSans",
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500),
                      text: "Resend",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          //Navigator.pop(context);
                        },
                    ),
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
