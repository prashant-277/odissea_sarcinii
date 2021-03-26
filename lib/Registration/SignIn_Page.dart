import 'dart:ui';

import 'package:flutter/material.dart';

class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  bool rememberMe = false;

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
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Sign In"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          color: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.network(
                "https://play-lh.googleusercontent.com/Rud6GixIU_jQGGVaJm8Lsl1bas6hayDnTQRPg3mrXLFgQ0Cnl3MHM6XyltCctAB_iRM=s180-rw",
              ),
              Text(
                "Odiseea Sarcinii",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email ID / Username",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_outline_rounded),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                width: 1,
                                color: Colors.black26,
                              ),
                            )
                          ],
                        )),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white38,
                  ),
                  padding: EdgeInsets.only(left: 5, right: 10)),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.vpn_key_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Container(
                                width: 1,
                                color: Colors.black26,
                              ),
                            )
                          ],
                        )),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white38,
                  ),
                  padding: EdgeInsets.only(left: 5, right: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: _onRememberMeChanged,
                  ),
                  Text("Remember Password"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Theme.of(context).accentColor,
                width: MediaQuery.of(context).size.width / 3,
                height: 35,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
