import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class recommendation extends StatefulWidget {
  @override
  _recommendationState createState() => _recommendationState();
}

class _recommendationState extends State<recommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Recommendation"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
