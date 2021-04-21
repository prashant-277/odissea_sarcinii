import 'dart:async';

import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/doctorVisit_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class month_Doctorvisit extends StatefulWidget {
  month_Doctorvisit();

  @override
  _month_DoctorvisitState createState() => _month_DoctorvisitState();
}

class _month_DoctorvisitState extends State<month_Doctorvisit> {
  CalendarController _controller;

  String saveDate;
  String data;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  static final now = DateTime.now();
  final dropdownDatePicker = DropdownDatePicker(
    dateFormat: DateFormat.dmy,
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
    dropdownColor: Colors.white,
    dateHint: DateHint(year: 'Format', month: 'Min', day: 'Hour'),
    ascending: false,
    underLine: Text(""),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            initialSelectedDay: DateTime.now(),
            rowHeight: 33,
            calendarStyle: CalendarStyle(
                todayColor: buttonColor,
                selectedColor: buttonColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    fontSize: 15.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(50.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: "OpenSans",
              ),
              formatButtonShowsNext: false,
              formatButtonVisible: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onDaySelected: (day, events, holidays) {
              print(day.toUtc());
              print(day.day.toString() +
                  day.month.toString() +
                  day.year.toString());
              saveDate = day.day.toString() +
                  day.month.toString() +
                  day.year.toString();
            },
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                    ),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                    ),
                  )),
            ),
            calendarController: _controller,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: statusbarColor,
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Dr.Appointment",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Row(
              children: [
                Text(
                  "Time",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 00),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: dropdownDatePicker),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(width: 1.0, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      "Reminder me",
                      style: TextStyle(
                          fontFamily: "OpenSans", fontWeight: FontWeight.w600),
                    ),
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: Colors.black,
                    ),
                    underline: Text(""),
                    elevation: 0,
                    items: <String>['10 days', '20 days', '30 days', '40 days']
                        .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    value: data,
                    onChanged: (newValue) {
                      setState(() {
                        data = newValue;
                        print(data);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              color: statusbarColor,
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Feelings",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Mood",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: kGray,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "OpenSans",
                      ),
                      hintText: 'Enter your mood',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Energy",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: kGray,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "OpenSans",
                      ),
                      hintText: 'Enter your energy',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Appetite",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: kGray,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "OpenSans",
                      ),
                      hintText: 'Enter your appetite',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Cravings",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: kGray,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "OpenSans",
                      ),
                      hintText: 'Enter your cravings',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Morning Sickness",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    style:
                        TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: kGray, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: kGray,
                          width: 1.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "OpenSans",
                      ),
                      hintText: 'Enter your sickness',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Container(
              color: statusbarColor,
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Other Notes & Questions",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
            child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: "OpenSans", color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: "OpenSans",
                    ),
                    hintText: 'Notes...',
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: kGray),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                padding: EdgeInsets.only(left: 5, right: 10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: primarybutton("Send", () {})),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
