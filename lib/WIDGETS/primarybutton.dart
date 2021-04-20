import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class primarybutton extends StatelessWidget {
  final String text;
  final Function onPressed;

  primarybutton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
    );
  }
}
