import 'package:flutter/material.dart';

class recommendation extends StatefulWidget {
  @override
  _recommendationState createState() => _recommendationState();
}

class _recommendationState extends State<recommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
