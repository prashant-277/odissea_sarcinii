import 'package:flutter/material.dart';

class ForgotPassword_Page extends StatefulWidget {
  @override
  _ForgotPassword_PageState createState() => _ForgotPassword_PageState();
}

class _ForgotPassword_PageState extends State<ForgotPassword_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        automaticallyImplyLeading: false,
        title: Text("Forgot Password"),
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
