import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/Registration/otpConfirmPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class ForgotPassword_Page extends StatefulWidget {
  @override
  _ForgotPassword_PageState createState() => _ForgotPassword_PageState();
}

class _ForgotPassword_PageState extends State<ForgotPassword_Page> {
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
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "Assets/Icons/back.png",
                fit: BoxFit.fill,
                color: kblack,
                height: 15,
              ),
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
              Container(
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
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
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
              SizedBox(
                height: 25,
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: primarybutton("Send", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => otpConfirmPage()));
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
