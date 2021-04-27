import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class termsandcondition extends StatefulWidget {
  @override
  _termsandconditionState createState() => _termsandconditionState();
}

class _termsandconditionState extends State<termsandcondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "Terms & Condition",
      ),
    );
  }
}
