import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/day_Doctorvisit.dart';
import 'package:odiseea_sarcinii/ME%20TAB/list_Doctorvisit.dart';
import 'package:odiseea_sarcinii/ME%20TAB/month_Doctorvisit.dart';
import 'package:table_calendar/table_calendar.dart';

class doctorVisit_page extends StatefulWidget {
  @override
  _doctorVisit_pageState createState() => _doctorVisit_pageState();
}

class _doctorVisit_pageState extends State<doctorVisit_page> {
  int theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text(
      "Day",
      style: TextStyle(color: Colors.white, fontSize: 13),
    ),
    1: Text(
      "Month",
      style: TextStyle(color: Colors.white, fontSize: 13),
    ),
    2: Text(
      "List",
      style: TextStyle(color: Colors.white, fontSize: 13),
    )
  };
  CalendarController _controller;

  List<Widget> bodies = [
    Container(child: day_Doctorvisit()),
    Container(child: month_Doctorvisit()),
    Container(child: list_Doctorvisit()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: bodies[theriGroupVakue],
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
              icon: Icon(Icons.email_outlined),
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          ],
          title: Container(
            width: MediaQuery.of(context).size.width / 1.8,
            child: CupertinoSegmentedControl(
              borderColor: Colors.white,
              pressedColor: Colors.white,
              selectedColor: Colors.white70,
              unselectedColor: Colors.transparent,
              groupValue: theriGroupVakue,
              onValueChanged: (changeFromGroupValue) {
                setState(() {
                  theriGroupVakue = changeFromGroupValue;
                  print(changeFromGroupValue);
                });
              },
              children: logoWidgets,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true),
    );
  }
}
