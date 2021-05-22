import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/Tabs/Home_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:html2md/html2md.dart' as html2md;

class weeksinfo_page extends StatefulWidget {
  var userDetail;

  weeksinfo_page(this.userDetail);

  @override
  _weeksinfo_pageState createState() => _weeksinfo_pageState(userDetail);
}

class _weeksinfo_pageState extends State<weeksinfo_page>
    with TickerProviderStateMixin {
  final url1 = url.basicUrl;
  final url2 = url.imageUrl;
  PageController pageController;

  //PageController  pageController= PageController(initialPage: 8);

  int newvalue = 0;
  bool isLoading = true;
  RangeLabels labels = RangeLabels("1", "270");

  double sliderValue;
  List weekDetail = [];

  var userDetail;

  _weeksinfo_pageState(this.userDetail);

  @override
  void initState() {
    super.initState();
    getweekDetail();
    pageController = PageController(initialPage: userDetail["week"]);
    print("userdetail " + userDetail.toString());
  }

  Future<void> getweekDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/week-detail";

    var map = new Map<String, dynamic>();
    map["week"] = userDetail["week"].toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("ddddd" + responseJson.toString());

    setState(() {
      weekDetail = responseJson["data"];
      sliderValue = double.parse(userDetail["total_day"].toString());
    });
    if (responseJson["status"].toString() == "Success") {
      isLoading = false;
    }
  }

  Future<void> getweekDetailminus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/week-detail";

    var map = new Map<String, dynamic>();
    map["week"] = (userDetail["week"] - 1).toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("ddddd minus " + responseJson.toString());

    setState(() {
      weekDetail = responseJson["data"];
    });
    if (responseJson["status"].toString() == "Success") {
      isLoading = false;
    }
  }

  Future<void> getweekDetailplus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/week-detail";

    var map = new Map<String, dynamic>();
    map["week"] = (userDetail["week"] + 1).toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("ddddd plus " + responseJson.toString());

    setState(() {
      weekDetail = responseJson["data"];
    });
    if (responseJson["status"].toString() == "Success") {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: BaseAppBar(
          appbartext: "Week " + userDetail["week"].toString(),
          appBar: AppBar(),
          widgets: [
            IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Image.asset(
                  "Assets/Icons/left_white.png",
                  height: 18,
                ),
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease);
                  setState(() {
                    getweekDetailminus();
                  });
                }),
            IconButton(
                icon: Image.asset(
                  "Assets/Icons/right_white.png",
                  height: 18,
                ),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease);
                  setState(() {
                    getweekDetailplus();
                  });
                })
          ],
        ),
        body: Container(
          child: isLoading
              ? SpinKitFadingFour(
                  color: buttonColor,
                  controller: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 1200)),
                )
              : PageView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  allowImplicitScrolling: false,
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: 42,
                  onPageChanged: changeWeek,
                  itemBuilder: (context, index) {
                    return weekDetail.toString() == "[]"
                        ? Center(
                            child: Container(
                            child: Text(
                              "No data found",
                              style: TextStyle(
                                  color: kblack,
                                  fontFamily: "OpenSans",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            color: kwhite,
                          ))
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(url2 +
                                            weekDetail[0]["image"].toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Day",style: TextStyle(color: kGray,fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w600)),
                                              Text(userDetail["total_day"].toString(),
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: kwhite,
                                                    fontFamily: "OpenSans",
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w600),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Days left",style: TextStyle(color: kGray,fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w600),),
                                              Text(
                                                userDetail["remain_day"]
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: kwhite,
                                                    fontFamily: "OpenSans",
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.10,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.19,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.zero,
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      color: kwhite,
                                                      border: Border.all(
                                                          color: buttonColor,
                                                          width: 5)),
                                                ),
                                                SliderTheme(
                                                    data: SliderThemeData(
                                                        trackHeight: 8,
                                                        thumbShape:
                                                            RoundSliderThumbShape(
                                                                enabledThumbRadius:
                                                                    3.0,
                                                                elevation: 0),
                                                        thumbColor: buttonColor,
                                                        showValueIndicator:
                                                            ShowValueIndicator
                                                                .always,
                                                        activeTrackColor:
                                                            kwhite,
                                                        inactiveTrackColor:
                                                            Colors.red,
                                                        valueIndicatorColor:
                                                            kwhite,
                                                        valueIndicatorTextStyle:
                                                            TextStyle(
                                                                color: kwhite,
                                                                fontFamily:
                                                                    "OpenSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                        valueIndicatorShape:
                                                            PaddleSliderValueIndicatorShape(),
                                                        trackShape:
                                                            CustomTrackShape(),
                                                        overlayColor:
                                                            Colors.transparent),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.50,
                                                      child: Slider(
                                                          value: sliderValue
                                                              .toDouble(),
                                                          min: 1,
                                                          max: 270,
                                                          divisions: 270,
                                                          activeColor:
                                                              buttonColor,
                                                          inactiveColor:
                                                              Colors.red[100],
                                                          label: 'Day ' +
                                                              '${sliderValue.round()}',
                                                          onChanged: (double
                                                              newValue) {
                                                            /*setState(() {
                                                        sliderValue =
                                                            newValue.round();
                                                      });*/
                                                          },
                                                          semanticFormatterCallback:
                                                              (double
                                                                  newValue) {
                                                            return '${newValue.round()}';
                                                          }),
                                                    )),
                                                Container(
                                                  height: 28,
                                                  width: 28,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      color: kwhite,
                                                      border: Border.all(
                                                          color:
                                                              Colors.red[100],
                                                          width: 5)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Baby size",
                                                  style: TextStyle(
                                                      color: kblack,
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    weekDetail[0]["baby_size"]
                                                            .toString() +
                                                        " mm",
                                                    style: TextStyle(
                                                        color: kblack,
                                                        fontFamily: "OpenSans",
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 30,
                                              width: 1,
                                              color: Colors.black12,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Baby weight",
                                                  style: TextStyle(
                                                      color: kblack,
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    weekDetail[0]["baby_weight"]
                                                            .toString() +
                                                        " gm",
                                                    style: TextStyle(
                                                        color: kblack,
                                                        fontFamily: "OpenSans",
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 15),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      child: primarybutton(
                                          userDetail["week"].toString() +
                                              " weeks of pregnancy",
                                          () {})),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/dear_cosmina.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Dear " +
                                                      userDetail["user_name"]
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["description"]
                                                        .toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["description"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/video.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Week " +
                                                      weekDetail[0]["week"]
                                                          .toString() +
                                                      " Video",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3.7,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  "Assets/Images/video_back.png",
                                                  fit: BoxFit.fill,
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Image.asset(
                                                    "Assets/Icons/video.png",
                                                    height: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/baby_bw.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Baby Information",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["baby_info"]
                                                        .toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["baby_info"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/mother.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Mother Information",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["mother_info"]
                                                        .toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["mother_info"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/info.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Extra Information",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["extra_info"]
                                                        .toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["extra_info"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/tips.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Tips",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["tips"].toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["tips"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "Assets/Images/background3.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  "Assets/Icons/symptoms.png",
                                                  height: 20,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0,
                                                    left: 8.0,
                                                    top: 5.0),
                                                child: Text(
                                                  "Symptoms",
                                                  style: TextStyle(
                                                      fontFamily: "OpenSans",
                                                      fontSize: 15,
                                                      color: kwhite,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            weekDetail[0]["symptoms"]
                                                        .toString() ==
                                                    "null"
                                                ? "No data"
                                                : html2md.convert(weekDetail[0]
                                                        ["symptoms"]
                                                    .toString()),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontSize: 15,
                                                color: kwhite),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          );
                  },
                ),
        ));
  }

  void changeWeek(int value) {
    setState(() {
      newvalue = userDetail["week"] = value;
      print("count " + newvalue.toString());
    });
  }
}
