import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/dobCalculatorPage.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/myweekTimeline.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weeksinfo_page.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {
  RangeLabels labels = RangeLabels("Day 1", "Day 270");
  final url1 = url.basicUrl;
  final url2 = url.imageUrl;

  bool isLoading = true;

  double sliderValue1;

  List userDetail = [];

  List weekDetail = [];

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

    final response = await http.post(url, headers: header);

    final responseJson = json.decode(response.body);
    print(responseJson);

    setState(() {
      userDetail = responseJson["data"];
      sliderValue1 =
          double.parse(userDetail[0]["user_data"]["total_day"].toString());
    });
    if (responseJson["status"] == "Success") {
      getweekDetail(userDetail[0]["user_data"]["week"]);
    }
  }

  Future<void> getweekDetail(week) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/week-detail";

    var map = new Map<String, dynamic>();
    map["week"] = "4"; //week.toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(url, headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("ddddd" + responseJson.toString());

    setState(() {
      isLoading = false;
      weekDetail = responseJson["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: isLoading
          ? SpinKitFadingFour(
              color: buttonColor,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            )
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("Assets/Images/background_crop2.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(""),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: kwhite,
                                      fontSize: 25,
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: kwhite,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ClipOval(
                                          child: FadeInImage(
                                              height: 80,
                                              width: 80,
                                              image: NetworkImage(userDetail[0]["user_data"]["image"].toString()==""?

                                                  "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                  : url2 + userDetail[0]["user_data"]["image"].toString()
                                                      ),
                                              fit: BoxFit.fill,
                                              placeholder:
                                              AssetImage("Assets/Images/giphy.gif")),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: kwhite,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: SingleChildScrollView(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.95,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  userDetail[0]["user_data"]["user_name"].toString(),
                                                  style: TextStyle(
                                                      color: kblack,
                                                      fontFamily: "OpenSans",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  userDetail[0]["user_data"]
                                                              ["week"]
                                                          .toString() +
                                                      " weeks & " +
                                                      userDetail[0]["user_data"]
                                                              ["days"]
                                                          .toString() +
                                                      " days",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      color: kblack,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  "Your baby is 520 mm & 1250 g",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      color: kblack,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            child:
                                                                dobCalculatorPage()));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 5.0),
                                                    child: Container(
                                                      height: 27,
                                                      width: 110,
                                                      child: Center(
                                                        child: Text(
                                                          "EDOB Calculator",
                                                          style: TextStyle(
                                                              color: kwhite,
                                                              fontFamily:
                                                                  "OpenSans",
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        color: buttonColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.19,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: buttonColor,
                                          border: Border.all(
                                              color: kwhite, width: 4)),
                                    ),
                                    SliderTheme(
                                        data: SliderThemeData(
                                            trackHeight: 6,
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 3.0,
                                                elevation: 0),
                                            thumbColor: buttonColor,
                                            showValueIndicator:
                                                ShowValueIndicator.always,
                                            activeTrackColor: kwhite,
                                            inactiveTrackColor: Colors.red,
                                            valueIndicatorColor: kwhite,
                                            valueIndicatorTextStyle: TextStyle(
                                                color: buttonColor,
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w600),
                                            valueIndicatorShape:
                                                PaddleSliderValueIndicatorShape(),
                                            trackShape: CustomTrackShape(),
                                            overlayColor: Colors.transparent),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.55,
                                          child: Slider(
                                            value: sliderValue1.toDouble(),
                                            min: 1,
                                            max: 270,
                                            divisions: 270,
                                            activeColor: kwhite,
                                            inactiveColor: Colors.red[700],
                                            label: 'Day ' +
                                                '${sliderValue1.round()}',
                                            onChanged: (double newValue) {
                                              setState(() {
                                                //sliderValue1 = newValue.round();
                                              });
                                            },
                                          ),
                                        )),
                                    Container(
                                      padding: EdgeInsets.zero,
                                      margin: EdgeInsets.zero,
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: buttonColor,
                                          border: Border.all(
                                              color: Colors.red[700],
                                              width: 4)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      userDetail[0]["user_data"]["dob"]
                                          .toString(),
                                      style: TextStyle(
                                          color: kwhite,
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      userDetail[0]["user_data"]["final_date"]
                                          .toString(),
                                      style: TextStyle(
                                          color: kwhite,
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      "Assets/Icons/down.png",
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4.0,
                      width: MediaQuery.of(context).size.width,
                      color: kwhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          Text(
                            weekDetail[0]["week"].toString() +
                                " weeks of \nPregnancy",
                            style: TextStyle(
                                color: kblack,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                fontSize: 24),
                          ),
                          Container(
                            child: FadeInImage(
                                height: 125,
                                width: 125,
                                image: NetworkImage(
                                    url2 + weekDetail[0]["image"].toString()),
                                fit: BoxFit.fill,
                                placeholder:
                                    AssetImage("Assets/Images/giphy.gif")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: kwhite,
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(milliseconds: 300),
                                child: weeksinfo_page()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Assets/Images/background3.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: Container(
                                child: Text(
                                  weekDetail[0]["description"].toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontSize: 15,
                                      color: kwhite),
                                  maxLines: 10,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FlatButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Text(
                                    "Read more...",
                                    style: TextStyle(
                                        color: kwhite,
                                        fontFamily: "OpenSans",
                                        fontSize: 14),
                                  ),
                                  onPressed: null),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: FlatButton(
                            color: buttonColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "Assets/Icons/right.png",
                                  height: 0,
                                  width: 0,
                                ),
                                Text(
                                  "My week timeline",
                                  style: TextStyle(
                                      color: kwhite,
                                      fontSize: 18,
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  "Assets/Icons/right.png",
                                  height: 15,
                                  width: 15,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      alignment: Alignment.bottomCenter,
                                      duration: Duration(milliseconds: 300),
                                      child: myweekTimeline()));
                            },
                            padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CustomTrackShape extends RectangularSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
