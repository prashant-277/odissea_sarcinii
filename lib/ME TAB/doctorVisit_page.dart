import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/day_Doctorvisit.dart';
import 'package:odiseea_sarcinii/ME%20TAB/list_Doctorvisit.dart';
import 'package:odiseea_sarcinii/ME%20TAB/month_Doctorvisit.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
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
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Doctor visit",
        appBar: AppBar(),
        widgets: [],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  labelStyle: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15),
                  labelColor: buttonColor,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: buttonColor,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: "Month",
                    ),
                    Tab(
                      text: "List",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(child: month_Doctorvisit()),
                  Container(child: list_Doctorvisit()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
