import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/addweightDetail.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      body: bodies[theriGroupVakue],
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width / 3.0,
          child: CupertinoSegmentedControl(
            borderColor: Colors.white,
            pressedColor: Colors.white,
            selectedColor: Colors.white,
            unselectedColor: Theme.of(context).accentColor,
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
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Icon(Icons.info_outline_rounded),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              child: Icon(Icons.add_circle_outline_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addweightDetail()));
              },
            ),
          )
        ],
      ),
    );
  }
}
