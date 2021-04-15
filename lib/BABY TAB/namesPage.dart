import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name.toString()),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          CupertinoSegmentedControl(
            borderColor: Colors.white,
            pressedColor: Colors.white,
            selectedColor: Colors.white,
            unselectedColor: Theme.of(context).accentColor,
            groupValue: theriGroupValue,
            onValueChanged: (changeFromGroupValue) {
              setState(() {
                theriGroupValue = changeFromGroupValue;
                print(changeFromGroupValue);
              });
            },
            children: logoWidgets,
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$index"),
                        Container(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Theme.of(context).accentColor,
                            )),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => nameDetail_page()));
                    },
                  ),
                ),
                Divider(
                  indent: 30.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
