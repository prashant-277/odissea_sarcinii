import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:intl/intl.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/contractionHistory_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:odiseea_sarcinii/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contractionCounter_page extends StatefulWidget {
  @override
  _contractionCounter_pageState createState() =>
      _contractionCounter_pageState();
}
void onStart() {
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

  // bring to foreground
  service.setForegroundMode(true);
  Timer.periodic(Duration(seconds: 1), (timer) async {
    if (!(await service.isServiceRunning())) timer.cancel();
    service.setNotificationInfo(
      title: "Contraction counter",
      content: "Updated at ${formatTime(_stopwatch.elapsedMilliseconds)}",
    );

    service.sendData(
      {"current_date": formatTime(_stopwatch.elapsedMilliseconds).toString()},
    );
  });
}
class _contractionCounter_pageState extends State<contractionCounter_page>
    with TickerProviderStateMixin{

  int   start = 0;
  Map<String, dynamic> timeStringforkick;
  String _timeString;

  Future<void> gettime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("timeString") == null) {
      prefs.setString("timeStringContraction", _formatDateTime(DateTime.now()).toString());
      setState(() {
        _timeString = prefs.getString("timeStringContraction");
      });
      print("if");
    } else {
      setState(() {
        _timeString = prefs.getString("timeStringContraction");
      });
      print("else");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Contraction",
         appBar: AppBar(),
         widgets: [
           IconButton(
               onPressed: () {
                 Navigator.of(context, rootNavigator: true).push(
                     MaterialPageRoute(
                         builder: (context) => contractionHistory_page()));
               },
               icon: Image.asset(
                 "Assets/Icons/history.png",
                 height: 15,
               ))
         ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => kick_Session_page()));*/


                  if(start==0){
                    setState(() {
                      start=1;
                      gettime();
                    });

                    FlutterBackgroundService.initialize(onStart);
                    FlutterBackgroundService().sendData({"action": "setAsForeground"});

                  }else{
                    var isRunning = await FlutterBackgroundService()
                        .isServiceRunning();
                    if (isRunning) {
                      FlutterBackgroundService().sendData(
                        {"action": "stopService"},
                      );
                      setState(() {
                        start=0;
                      });

                    } else {
                      FlutterBackgroundService.initialize(onStart);
                    }
                  }

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.13,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/Images/background_point.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "Assets/Icons/contraction_act.png",
                          height: 70,
                        ),
                        Text(start==0 ?
                          "Start Contraction"
                            : "Stop Contraction",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                              fontSize: 18),
                        ),
                        Image.asset(start==0 ?
                          "Assets/Icons/start.png"
                            : "Assets/Icons/stop.png",
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kGray),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: buttonColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last contraction information",
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600,
                                          color: kwhite,
                                          fontSize: 16
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Start time : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(_timeString == null ? "00:00:00" : _timeString,
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w500,
                                              color: kblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Duration : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          StreamBuilder<Map<String, dynamic>>(
                                            stream: FlutterBackgroundService().onDataReceived,
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Text("00:00:00",
                                                    style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontWeight: FontWeight.w500,
                                                      color: kblack,
                                                    ),
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
                                                  color: kblack,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Interval : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            "56 min 2 sec",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w500,
                                              color: kblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('h:mm:ss a ').format(dateTime);
  }
}
