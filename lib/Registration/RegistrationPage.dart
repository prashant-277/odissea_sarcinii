import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/Registration/ForgotPassword_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/Registration/SignUp_Page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.network(
                "https://play-lh.googleusercontent.com/Rud6GixIU_jQGGVaJm8Lsl1bas6hayDnTQRPg3mrXLFgQ0Cnl3MHM6XyltCctAB_iRM=s180-rw"),
            Text(
              "Odiseea Sarcinii",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp_Page()));
                  },
                  child: Text(
                    "Sign UP",
                    style: TextStyle(color: Colors.purple),
                  ),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn_Page()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.purple),
                  ),
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 35,
              color: Colors.indigo,
              child: FlatButton(
                color: Colors.indigo,
                onPressed: () {},
                child: Text(
                  "Log In with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,

              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPassword_Page()));
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "> Skip",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
