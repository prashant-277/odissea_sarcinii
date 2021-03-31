import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:table_calendar/table_calendar.dart';

class addweightDetail extends StatefulWidget {
  @override
  _addweightDetailState createState() => _addweightDetailState();
}

class _addweightDetailState extends State<addweightDetail> {
  CalendarController _controller;

  String saveDate;

  var _currentValueweight = 45;
  var _currentValuemonth = 5;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Weight Detail"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Done"),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (dateTime) {
                    debugPrint("$dateTime");
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Weight is : " +
                          _currentValueweight.toString() +
                          " Kg" +
                          " & " +
                          "Current Month is : " +
                          _currentValuemonth.toString(),
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Weight : "),
                      NumberPicker(
                        value: _currentValueweight,
                        minValue: 30,
                        maxValue: 150,
                        step: 1,
                        haptics: true,
                        itemHeight: 30,
                        selectedTextStyle: TextStyle(fontSize: 17),
                        textStyle:
                            TextStyle(fontSize: 17, color: Colors.black26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        onChanged: (value) =>
                            setState(() => _currentValueweight = value),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text("Month : "),
                      NumberPicker(
                        value: _currentValuemonth,
                        minValue: 0,
                        maxValue: 10,
                        step: 1,
                        haptics: true,
                        selectedTextStyle: TextStyle(fontSize: 17),
                        textStyle:
                            TextStyle(fontSize: 17, color: Colors.black26),
                        itemHeight: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        onChanged: (value) =>
                            setState(() => _currentValuemonth = value),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
