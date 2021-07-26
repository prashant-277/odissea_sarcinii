import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;
class kickSession_page extends StatefulWidget {

  @override
  _kickSession_pageState createState() => _kickSession_pageState();
}

Future<void> onStart() async {
  Stopwatch _stopwatch;
  Timer _timer;
  _stopwatch = Stopwatch();
  _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {});

  _stopwatch.start();
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();

  service.onDataReceived.listen((event) {
    if (event["action"] == "setAsForeground") {
      service.setForegroundMode(true);
      return;
    }

    if (event["action"] == "setAsBackground") {
      service.setForegroundMode(false);
    }

    if (event["action"] == "stopService") {
      service.stopBackgroundService();
      _stopwatch.stop();
    }
  });

  service.setForegroundMode(true);
  Timer.periodic(Duration(seconds: 1), (timer) async {
    if (!(await service.isServiceRunning())) timer.cancel();
    service.setNotificationInfo(
      title: "Kick session is running",
      content: "Updated at ${formatTime(_stopwatch.elapsedMilliseconds)}",
    );

    service.sendData(
      {"current_date": formatTime(_stopwatch.elapsedMilliseconds).toString()},
    );
  });
  var isRunning = await service
      .isServiceRunning();
  print("Kick++++++++++++++++++++"+isRunning.toString());
}

class _kickSession_pageState extends State<kickSession_page>
    with TickerProviderStateMixin {
  String _timeString;
  final url1 = url.basicUrl;
  Map<String, dynamic> timeStringforkick;
  List kickRecordData = [];
  String flag;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    FlutterBackgroundService.initialize(onStart);
    FlutterBackgroundService().sendData({"action": "setAsForeground"});
    gettime();
    //kickCounter("start");
  }

  Future<void> gettime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("timeString") == null) {
      prefs.setString("timeString", _formatDateTime(DateTime.now()).toString());
      setState(() {
        _timeString = prefs.getString("timeString");
        kickCounter("start");
      });
      print("if");
    } else {
      setState(() {
        _timeString = prefs.getString("timeString");
        isLoading = false;
      });
      print("else");
      kickCounter("start");
    }
  }

  /*@override
  void dispose() {
    super.dispose();
    FlutterBackgroundService().sendData({"action": "setAsForeground"});
  }*/

  Future<void> kickCounter(String flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", null);
    prefs.setString("alphabet", null);

    print("flag---- " + flag.toString());
    var url = "$url1/kickCount";

    var map = new Map<String, dynamic>();
    map["time"] = _formatDateTime(DateTime.now()).toString();
    map["duration"] = flag=="start" ? "00:00:00" : timeStringforkick.toString().substring(14, 23).toString();
    map["flag"] = flag.toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("kick Counter " + responseJson.toString());

    if(responseJson["status"].toString()=="Success"){
      setState(() {
        kickRecordData = responseJson["data"];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "Session",
      ),
      body: isLoading
          ? SpinKitFadingFour(
        color: buttonColor,
        controller: AnimationController(
            vsync: this, duration: const Duration(milliseconds: 1200)),
      )
          : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      print(timeStringforkick.toString().substring(14, 23));
                      print(_formatDateTime(DateTime.now()).toString());
                      kickCounter("kick");
                    },
                    icon: Image.asset(
                      "Assets/Icons/kick.png",
                      color: buttonColor,
                    ),
                    iconSize: 70,
                    splashRadius: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Record kick",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          color: buttonColor,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGray),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: buttonColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No.",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600,
                                      color: kwhite,
                                      fontSize: 15),
                                ),
                                Text(
                                  "Kick time",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600,
                                      color: kwhite,
                                      fontSize: 15),
                                ),
                                Text(
                                  "Kick session",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600,
                                      color: kwhite,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                                height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                              itemCount: kickRecordData == null ? " " : kickRecordData.length,
                              itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.only(left: 25,  top: 5,
                                  right: 25, bottom: 5),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight:
                                            FontWeight.w500,
                                            color: kblack,
                                            fontSize: 15),
                                      ),
                                      Text(kickRecordData[index]["time"].toString(),
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight:
                                            FontWeight.w500,
                                            color: kblack,
                                            fontSize: 15),
                                      ),
                                      Text(kickRecordData[index]["duration"].toString(),
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight:
                                            FontWeight.w500,
                                            color: kblack,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Divider(),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/bottom_shape.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              var isRunning = await FlutterBackgroundService()
                                  .isServiceRunning();
                              if (isRunning) {
                                FlutterBackgroundService().sendData(
                                  {"action": "stopService"},
                                );

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  prefs.setString("timeString", null);
                                  kickCounter("stop");
                                });
                                Navigator.pop(context,true);
                              } else {
                                FlutterBackgroundService.initialize(onStart);
                              }
                            },
                            icon: Image.asset("Assets/Icons/stop.png")),
                        Text("Stop",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                                fontSize: 15)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Start time",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                color: kwhite,
                                fontSize: 15)),
                        Text(_timeString == null ? "" : _timeString,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                                fontSize: 15))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Duration",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                color: kwhite,
                                fontSize: 15)
                        ),
                        /*Text(formatTime(_stopwatch.elapsedMilliseconds),
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                                fontSize: 15))*/
                        StreamBuilder<Map<String, dynamic>>(
                          stream: FlutterBackgroundService().onDataReceived,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: SpinKitRing(
                                  color: kwhite,
                                  lineWidth: 3,
                                  size: 20,
                                  controller: AnimationController(
                                      vsync: this,
                                      duration:
                                          const Duration(milliseconds: 1200)),
                                ),
                              );
                            }
                            final data = snapshot.data;
                            DateTime date =
                                DateTime.tryParse(data["current_date"]);
                            timeStringforkick = snapshot.data;
                            return Text(
                              data.toString().substring(14, 23),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm:ss a ').format(dateTime);
  }
}
