import 'dart:async';
import 'dart:convert';

import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class month_Doctorvisit extends StatefulWidget {
  month_Doctorvisit();

  @override
  _month_DoctorvisitState createState() => _month_DoctorvisitState();
}

class _month_DoctorvisitState extends State<month_Doctorvisit> {
  CalendarController _controller;
  final url1 = url.basicUrl;

  TextEditingController moodCtrl = TextEditingController();
  TextEditingController energyCtrl = TextEditingController();
  TextEditingController appetiteCtrl = TextEditingController();
  TextEditingController cravingsCtrl = TextEditingController();
  TextEditingController morningsicknessCtrl = TextEditingController();
  TextEditingController notesCtrl = TextEditingController();

  String saveDate;
  var saveTime;
  String data;

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
            initialSelectedDay: DateTime.now(),
            rowHeight: MediaQuery.of(context).size.height / 18,
            calendarStyle: CalendarStyle(
                todayColor: buttonColor,
                selectedColor: buttonColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    fontSize: 15.0,
                    color: kwhite)),
            headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: kwhite,
                  fontSize: 18.0,
                  fontFamily: "OpenSans",
                ),
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w700)),
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onDaySelected: (day, events, holidays) {
              print("day " + day.toString());

              saveDate = day.day.toString() +
                  "-" +
                  day.month.toString() +
                  "-" +
                  day.year.toString();

              print("saveDate " + saveDate);
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
                      color: kwhite,
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
                      color: kwhite,
                      fontFamily: "OpenSans",
                    ),
                  )),
            ),
            calendarController: _controller,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 2.0,
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
                      "Dr.Appointment",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          color: kwhite,
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
                      color: kblack,
                      fontFamily: "OpenSans",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.1,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    backgroundColor: kwhite,
                    onTimerDurationChanged: (value) {
                      saveTime = value;
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.13,
                  decoration: new BoxDecoration(
                    color: kwhite,
                    border: new Border.all(width: 1.0, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      "Remind me",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          color: kblack,
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: kblack),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: kblack,
                    ),
                    underline: Text(""),
                    elevation: 0,
                    items: <String>[
                      'Never',
                      '15 minutes before',
                      '1 Hour before',
                      '1 Day before'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kblack)),
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
                          color: kwhite,
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
                    Text(
                      "Mood",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: textfield(
                    controller: moodCtrl,
                    prefixIcon: null,
                    suffixIcon: null,
                    textInputType: TextInputType.text,
                    parametersValidate: null,
                    functionValidate: null,
                    hintText: "Enter your mood",
                    obscureText: false,
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
                    Text(
                      "Energy",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: textfield(
                    controller: energyCtrl,
                    prefixIcon: null,
                    suffixIcon: null,
                    textInputType: TextInputType.text,
                    parametersValidate: null,
                    functionValidate: null,
                    hintText: "Enter your energy",
                    obscureText: false,
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
                    Text(
                      "Appetite",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: textfield(
                    controller: appetiteCtrl,
                    prefixIcon: null,
                    suffixIcon: null,
                    textInputType: TextInputType.text,
                    parametersValidate: null,
                    functionValidate: null,
                    hintText: "Enter your appetite",
                    obscureText: false,
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
                    Text(
                      "Cravings",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: textfield(
                    controller: cravingsCtrl,
                    prefixIcon: null,
                    suffixIcon: null,
                    textInputType: TextInputType.text,
                    parametersValidate: null,
                    functionValidate: null,
                    hintText: "Enter your cravings",
                    obscureText: false,
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
                    Text(
                      "Morning Sickness",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: textfield(
                    controller: morningsicknessCtrl,
                    prefixIcon: null,
                    suffixIcon: null,
                    textInputType: TextInputType.text,
                    parametersValidate: null,
                    functionValidate: null,
                    hintText: "Enter your sickness",
                    obscureText: false,
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
                          color: kwhite,
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
                  controller: notesCtrl,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: "OpenSans", color: kblack),
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
                child: primarybutton("Send", () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var url = "$url1/createDoctorList";

                  var map = new Map<String, dynamic>();
                  map["appointment_date"] = saveDate.toString();
                  map["appointment_time"] = saveTime.toString();
                  map["remind_me"] = "Never";
                  map["mood"] = moodCtrl.text.toString();
                  map["energy"] = energyCtrl.text.toString();
                  map["appetite"] = appetiteCtrl.text.toString();
                  map["craving"] = cravingsCtrl.text.toString();
                  map["sickness"] = morningsicknessCtrl.text.toString();
                  map["notes"] = notesCtrl.text.toString();

                  Map<String, String> header = {
                    "Authorization": prefs.getString("apiToken").toString()
                  };

                  final response = await http.post(Uri.parse(url),
                      headers: header, body: map);

                  final responseJson = json.decode(response.body);
                  print("Doctor visit-- " + responseJson.toString());

                  if (responseJson["status"].toString() == "Success") {
                    DefaultTabController.of(context).animateTo(1);
                    displayToast("Your Dr.Appointment added successfully");
                  }else{
                    displayToast(responseJson["message"].toString());

                  }
                })),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
