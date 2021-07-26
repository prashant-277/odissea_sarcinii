import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class kickshowDetail_page extends StatefulWidget {
  var kickData;

  kickshowDetail_page(this.kickData);

  @override
  _kickshowDetail_pageState createState() => _kickshowDetail_pageState();
}

class _kickshowDetail_pageState extends State<kickshowDetail_page>
    with  TickerProviderStateMixin{
  final url1 = url.basicUrl;
  List kickSessionData = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getkickSessionbData();
  }

  Future<void> getkickSessionbData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/getKickdetail";

    var map = new Map<String, dynamic>();
    map["unique_id"] = widget.kickData.toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), body:map, headers: header);

    final responseJson = json.decode(response.body);
    print("kickCount " + responseJson.toString());

    if(responseJson["status"].toString()=="Success"){
      setState(() {
        kickSessionData = responseJson["data"];
      });
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "Session detail",

      ),
      body:  isLoading
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
                      displayToast("Session already done...");
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
                              itemCount: kickSessionData==null ? "" : kickSessionData.length,
                              itemBuilder: (context, index) {
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
                                          Text(
                                            kickSessionData[index]["time"].toString(),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight:
                                                FontWeight.w500,
                                                color: kblack,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            kickSessionData[index]["duration"].toString(),
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
                            onPressed: () {},
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
                        Text(kickSessionData[0]["time"].toString(),
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
                                fontSize: 15)),
                        Text(kickSessionData[kickSessionData.length-1]["duration"].toString(),
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                                fontSize: 15))

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
}
