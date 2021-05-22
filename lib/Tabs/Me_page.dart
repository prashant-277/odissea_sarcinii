import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/myweekTimeline.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weeksinfo_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/mypoints_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weekSingle_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/doctorVisit_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weight_tracker.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';

import '../ME TAB/myPhotos_page.dart';

class Me_page extends StatefulWidget {
  final String title;

  const Me_page({Key key, this.title}) : super(key: key);

  @override
  _Me_pageState createState() => _Me_pageState();
}

class _Me_pageState extends State<Me_page> {
  double sliderValue1;

  List userDetail = [];
  final url1 = url.basicUrl;


  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/home";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("Home screen "  + responseJson.toString());

    setState(() {
      userDetail = responseJson["data"];
      sliderValue1 = double.parse(userDetail[0]["user_data"]["total_day"].toString());
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/background_new_me.png"),
              fit: BoxFit.fill,
            ),

          ),
          child: Column(
            children: [
              Text(""),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      "Me",
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 25,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.37,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        text: "My Week",
                        imageName: "Assets/Icons/my_week.png",
                        onTapped: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 300),
                                  child: weeksinfo_page(userDetail[0]["user_data"])));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        text: "My Journal",
                        imageName: "Assets/Icons/my_journal.png",
                        onTapped: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        text: "My Questions",
                        imageName: "Assets/Icons/my_questions.png",
                        onTapped: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        text: "My Groups",
                        imageName: "Assets/Icons/my_group.png",
                        onTapped: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        onTapped: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 300),
                                  child: myweekTimeline()));
                        },
                        text: "My Photos",
                        imageName: "Assets/Icons/my_photos.png",
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listtiles(
                          onTapped: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    alignment: Alignment.bottomCenter,
                                    duration: Duration(milliseconds: 300),
                                    child: doctorVisit_page()));
                          },
                          text: "Doctor Visit",
                          imageName: "Assets/Icons/doctor_visit.png",
                        )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(
                        onTapped: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 300),
                                  child: weight_tracker()));
                        },
                        text: "Weight Tracker",
                        imageName: "Assets/Icons/weight_tracker.png",
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listtiles(
                          text: "Plan Online Consultation",
                          imageName: "Assets/Icons/my_points.png",
                          onTapped: () {},
                        )),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: listtiles(

                        text: "My Points",
                        imageName: "Assets/Icons/plan_online.png",
                        onTapped: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 300),
                                  child: mypoints_page()));

                        },
                      ),
                    ),

                    /*FlutterSlider(
                  values: [300],
                  max: 500,
                  min: 0,
                  onDragging: (handlerIndex, lowerValue, upperValue) {},
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Material(
                      type: MaterialType.canvas,
                      color: Colors.orange,
                      elevation: 3,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                              "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80")),
                    ),
                  ),
                  jump: true,
                  touchSize: 50,
                )*/
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
