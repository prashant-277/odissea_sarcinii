import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class termsandcondition extends StatefulWidget {
  @override
  _termsandconditionState createState() => _termsandconditionState();
}

class _termsandconditionState extends State<termsandcondition>
    with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;

  int count;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _appLifecycleState = state;
      print("My App State: $_appLifecycleState");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: BaseAppBar(
          appBar: AppBar(),
          appbartext: "Terms & Condition",
        ),
        body: Container(
            child: Center(
                child: Column(
          children: [
            new Text(_appLifecycleState.toString() + count.toString(),
                style: new TextStyle(
                  fontSize: 22.0,
                )),
            MaterialButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white),
              ),
              color: buttonColor,
            )
          ],
        ))));
  }
}
