import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

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

  static final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add weight detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop('dialog');
                    },
                    icon: Image.asset(
                      "Assets/Icons/cancel.png",
                      height: 15,
                    ))
              ],
            ),
            Text(
              "Start week is 28",
              style: TextStyle(
                  color: buttonColor,
                  fontFamily: "OpenSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: DropdownDatePicker(
                    dateFormat: DateFormat.dmy,
                    firstDate:
                    ValidDate(year: now.year - 100, month: 1, day: 1),
                    lastDate: ValidDate(
                        year: now.year, month: now.month, day: now.day),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
                    dropdownColor: Colors.white,
                    dateHint:
                    DateHint(year: 'year', month: 'month', day: 'day'),
                    ascending: false,
                    underLine: Text(""),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Weight is " +
                        _currentValueweight.toString() +
                        "." +
                        _currentValuemonth.toString() +
                        " Kg",
                    style: TextStyle(
                        color: buttonColor,
                        fontFamily: "OpenSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
                NumberPicker(
                  value: _currentValueweight,
                  minValue: 30,
                  maxValue: 150,
                  step: 1,
                  haptics: true,
                  itemHeight: 30,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  onChanged: (value) =>
                      setState(() => _currentValueweight = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: buttonColor, fontWeight: FontWeight.bold),
                  ),
                ),
                NumberPicker(
                  value: _currentValuemonth,
                  minValue: 0,
                  maxValue: 10,
                  step: 1,
                  haptics: true,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
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
            Text(
              "Current week is 31",
              style: TextStyle(
                  color: buttonColor,
                  fontFamily: "OpenSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: DropdownDatePicker(
                    dateFormat: DateFormat.dmy,
                    firstDate:
                    ValidDate(year: now.year - 100, month: 1, day: 1),
                    lastDate: ValidDate(
                        year: now.year, month: now.month, day: now.day),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
                    dropdownColor: Colors.white,
                    dateHint:
                    DateHint(year: 'year', month: 'month', day: 'day'),
                    ascending: false,
                    underLine: Text(""),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Weight is " +
                        _currentValueweight.toString() +
                        "." +
                        _currentValuemonth.toString() +
                        " Kg",
                    style: TextStyle(
                        color: buttonColor,
                        fontFamily: "OpenSans",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
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
                NumberPicker(
                  value: _currentValueweight,
                  minValue: 30,
                  maxValue: 150,
                  step: 1,
                  haptics: true,
                  itemHeight: 30,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  onChanged: (value) =>
                      setState(() => _currentValueweight = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: buttonColor, fontWeight: FontWeight.bold),
                  ),
                ),
                NumberPicker(
                  value: _currentValuemonth,
                  minValue: 0,
                  maxValue: 10,
                  step: 1,
                  haptics: true,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
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
            Container(
                width: MediaQuery.of(context).size.width / 1,
                child: primarybutton("Add", () {}))
          ],
        ),
      ),
    );
  }
}
