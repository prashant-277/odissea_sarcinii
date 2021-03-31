import 'dart:async';

import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/doctorVisit_page.dart';
import 'package:table_calendar/table_calendar.dart';

class month_Doctorvisit extends StatefulWidget {
  month_Doctorvisit();

  @override
  _month_DoctorvisitState createState() => _month_DoctorvisitState();
}

class _month_DoctorvisitState extends State<month_Doctorvisit> {
  CalendarController _controller;

  String saveDate;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                todayColor: Theme.of(context).accentColor,
                selectedColor: Theme.of(context).accentColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(22.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
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

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => doctorVisit_page()));
            },
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            calendarController: _controller,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Slide left/Right to select the date for yout next doctor visit",
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
