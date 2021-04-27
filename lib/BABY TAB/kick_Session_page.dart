import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class kick_Session_page extends StatefulWidget {
  @override
  _kick_Session_pageState createState() => _kick_Session_pageState();
}

class _kick_Session_pageState extends State<kick_Session_page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Session"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(icon: Icon(Icons.delete_rounded), onPressed: () {})
        ],
      ),
      body: Center(
          child: MaterialButton(
        onPressed: () async {

        },
        child: Text("Start Service"),
      )),
    );
  }
}
