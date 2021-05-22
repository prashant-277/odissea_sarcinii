import 'dart:convert';

import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class addweightDetail extends StatefulWidget {
  @override
  _addweightDetailState createState() => _addweightDetailState();
}

class _addweightDetailState extends State<addweightDetail> {
  final url1 = url.basicUrl;

  var _startValueweight = 45;
  var _startValuemonth = 5;

  var _currentValueweight = 45;
  var _currentValuemonth = 5;

  var savestartweek;
  var savecurrentweek;

  static final now = DateTime.now();

  var today= new DateTime(now.year, now.month, now.day);
  var currentweekcal= new DateTime(now.year+1, now.month, now.day);

  num startweek = 0;
  num currentweek = 0;

  @override
  void initState() {
    super.initState();
    //savestartweek = Jiffy(today.toString()).diff(Jiffy([2022, 5, 7]), Units.WEEK);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(

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
                "Start week is " + startweek.toString(),
                style: TextStyle(
                    color: buttonColor,
                    fontFamily: "OpenSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  height: 50,
                    width: MediaQuery.of(context).size.width / 1.0,
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
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          backgroundColor: kwhite,
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime(now.year,now.month+9,now.day),
                          onDateTimeChanged: (value) {
                            setState(() {
                              savestartweek = value;
                              startweek = Jiffy(savestartweek.toString().substring(0,10)).diff(Jiffy(today.toString()), Units.WEEK);
                            });
                            print(savestartweek.toString().substring(0,10));

                            print("start week  " + startweek.toString());


                          }),
                    ),),
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
                          _startValueweight.toString() +
                          "." +
                          _startValuemonth.toString() +
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
                    value: _startValueweight,
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
                        setState(() {
                          _startValueweight = value;
                          print("_startValueweight "+ _startValueweight.toString());
                        }),
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
                    value: _startValuemonth,
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
                        setState(() {
                          _startValuemonth = value;
                          print("_startValuemonth "+ _startValuemonth.toString());
                        } ),
                  ),
                ],
              ),
              Text(
                "Current week is " + currentweek.toString(),
                style: TextStyle(
                    color: buttonColor,
                    fontFamily: "OpenSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.0,
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
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        backgroundColor: kwhite,
                        minimumDate: DateTime.now(),
                        maximumDate: DateTime(now.year,now.month+9,now.day),
                        onDateTimeChanged: (value) {
                          setState(() {
                            savecurrentweek = value;
                            currentweek = Jiffy(savecurrentweek.toString()).diff(Jiffy(today.toString()), Units.WEEK);
                            print("current week "+ currentweek.toString());
                          });
                        }),
                  ),),
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
                  child: primarybutton("Add", () async {

                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    var url = "$url1/createWeightList";

                    var map = new Map<String, dynamic>();
                    map["start_week"] = startweek.toString();
                    map["current_week"] = currentweek.toString();
                    map["start_weight"] = _startValueweight.toString() +"."+ _startValuemonth.toString();
                    map["current_weight"] = _currentValueweight.toString() +"."+ _currentValuemonth.toString();

                    Map<String, String> header = {
                      "Authorization": prefs.getString("apiToken").toString()
                    };

                    final response = await http.post(Uri.parse(url), headers: header, body: map);

                    final responseJson = json.decode(response.body);
                    print("ad weight " + responseJson.toString());


                    print("start week " + startweek.toString());
                    print("current_week " + currentweek.toString());
                    print("start_weight " + _startValueweight.toString() +"."+ _startValuemonth.toString());
                    print("current_weight " + _currentValueweight.toString() +"."+ _currentValuemonth.toString());


                    if(responseJson["status"].toString()=="Success"){Navigator.pop(context);}
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
