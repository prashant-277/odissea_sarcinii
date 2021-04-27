import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/addweightDetail.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weightChartpage.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weightListpage.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class weight_tracker extends StatefulWidget {
  @override
  _weight_trackerState createState() => _weight_trackerState();
}

class _weight_trackerState extends State<weight_tracker> {
  int theriGroupVakue = 0;
  bool select = false;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Icon(
      Icons.line_weight,
    ),
    1: Icon(
      Icons.graphic_eq_rounded,
    ),
  };

  List<Widget> bodies = [
    Container(child: Text("")),
    Container(child: Text("")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Weight tracker",
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
                color: kwhite,
                child: TabBar(
                  labelStyle: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                      fontSize: 15),
                  labelColor: buttonColor,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: buttonColor,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: "List",
                    ),
                    Tab(
                      text: "Chart",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(

                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(child: weightListpage()),
                  Container(child: weightChartpage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
