import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class mypoints_page extends StatefulWidget {
  @override
  _mypoints_pageState createState() => _mypoints_pageState();
}

class _mypoints_pageState extends State<mypoints_page>
    with TickerProviderStateMixin {
  int sliderValue = 90;
  final url1 = url.basicUrl;
  bool isLoading = true;

  var userData;

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  Future<void> getUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/user-detail";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print(responseJson);

    setState(() {
      userData = responseJson["data"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "My Points",
        appBar: AppBar(),
      ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image.asset(
                        "Assets/Images/vector.png",
                        width: MediaQuery.of(context).size.width / 1.2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Your Earned Points",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500,
                            color: kblack,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("Assets/Images/background_point.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          userData["reward_point"].toString(),
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                              fontSize: 70),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          SliderTheme(
                            data: SliderThemeData(
                                trackHeight: 15,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8.5, elevation: 0)),
                            child: Slider(
                              value: double.parse(
                                  userData["reward_point"].toString()),
                              max: 150.0,
                              min: 0.0,
                              activeColor: Color(0xFF00BB0C),
                              inactiveColor: kGray,
                              onChanged: (double newValue) {
                                setState(() {
                                  //sliderValue = newValue.round();
                                });
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w500,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  userData["reward_point"].toString() +
                                      "/150 POINTS",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 16),
                                ),
                                Text("150",
                                    style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
