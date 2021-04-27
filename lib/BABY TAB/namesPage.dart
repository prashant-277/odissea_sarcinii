import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/nameFilter_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

import 'nameDetail_page.dart';

class namesPage extends StatefulWidget {
  var name;

  namesPage(this.name);

  @override
  _namesPageState createState() => _namesPageState();
}

class _namesPageState extends State<namesPage> {
  int theriGroupValue = 0;

  final Map<int, Widget> logoWidgets = <int, Widget>{
    0: Container(width: 25, height: 15, child: Center(child: Text("B"))),
    1: Container(width: 25, height: 15, child: Center(child: Text("G"))),
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
        appbartext: "Name",
        appBar: AppBar(),
        widgets: [
          IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(builder: (context) => nameFilter_page()));
              },
              icon: Image.asset(
                "Assets/Icons/filter.png",
                height: 15,
              ))
        ],
      ),
      body: Container(
        color: kwhite,
        child: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: kGray, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name.toString() + " $index",
                        style: TextStyle(
                            color: kblack,
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
