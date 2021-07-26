import 'dart:async';
import 'dart:io';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Dashboard_Page.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Registration/RegistrationPage.dart';

void main() async {
  //HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterBackgroundService.initialize(onStart);

  runApp(MyApp());
}

Stopwatch _stopwatch;
Timer _timer;
// void onStart() {
//   _stopwatch = Stopwatch();
//   _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {});
//
//   _stopwatch.start();
//   WidgetsFlutterBinding.ensureInitialized();
//   final service = FlutterBackgroundService();
//   service.onDataReceived.listen((event) {
//     if (event["action"] == "setAsForeground") {
//       service.setForegroundMode(true);
//       return;
//     }
//
//     if (event["action"] == "setAsBackground") {
//       service.setForegroundMode(false);
//     }
//
//     if (event["action"] == "stopService") {
//       service.stopBackgroundService();
//     }
//   });
//
//   // bring to foreground
//   service.setForegroundMode(true);
//   Timer.periodic(Duration(seconds: 1), (timer) async {
//     if (!(await service.isServiceRunning())) timer.cancel();
//     service.setNotificationInfo(
//       title: "Kick session",
//       content: "Updated at ${formatTime(_stopwatch.elapsedMilliseconds)}",
//     );
//
//     service.sendData(
//       {"current_date": formatTime(_stopwatch.elapsedMilliseconds).toString()},
//     );
//   });
// }

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            /*primaryColor: buttonColor,
          accentColor: kwhite,
          backgroundColor: kblack,*/
            ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2000),
        () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,,./kL"

                duration: Duration(milliseconds: 2000),
                alignment: Alignment.bottomCenter,
                child: RegistrationPage())));
    Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RegistrationPage())));
  }*/

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "Assets/Images/background.png",
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Image.asset(
                  "Assets/Images/logo.png",
                  height: 330,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Copyright © Desprecopii.com ",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 13,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500),
                      ),
                      Image.asset(
                        "Assets/Images/icon.png",
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      nextScreen: RegistrationPage(),
      duration: 1000,
      pageTransitionType: PageTransitionType.fade,
    );

    /*Scaffold(
      backgroundColor: kwhite,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "Assets/Images/background.png",
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Image.asset(
                  "Assets/Images/logo.png",
                  height: 330,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Copyright © Desprecopii.com ",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 13,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500),
                      ),
                      Image.asset(
                        "Assets/Images/icon.png",
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );*/
  }
}

/*class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/
