import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kickDetail_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'kickshowDetail_page.dart';

class kickCounter_page extends StatefulWidget {
  @override
  _kickCounter_pageState createState() => _kickCounter_pageState();
}

class _kickCounter_pageState extends State<kickCounter_page> with
    TickerProviderStateMixin{
  final url1 = url.basicUrl;
  List kickData = [];
  bool isLoading = true;
  Map<String, dynamic> timeStringforkick;

  String message="";
  @override
  void initState() {
    super.initState();
    getKickData();
  }

  Future<void> getKickData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/kickData";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("kickCount " + responseJson.toString());

    if(responseJson["status"].toString()=="Success"){
      setState(() {
        kickData = responseJson["data"];
        message = responseJson["message"].toString();
        isLoading = false;
      });
    }else{
      setState(() {
        message = responseJson["message"].toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Kick counter",
        appBar: AppBar(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context,rootNavigator: true).
                push(new MaterialPageRoute(builder: (_)=>new kickSession_page()))
                    .then((val)=>getKickData());
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
                          "Assets/Icons/kick.png",
                          color: kwhite,
                          height: 70,
                        ),
                        Text(
                          "Start new session",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                              fontSize: 18),
                        ),
                        Image.asset(
                          "Assets/Icons/start.png",
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
                child: isLoading
                    ? SpinKitFadingFour(
                  color: buttonColor,
                  controller: AnimationController(
                      vsync: this, duration: const Duration(milliseconds: 1200)),
                )
                    : message.toString()=="No Data Found"? Container(
                  child: Center(
                    child: Text("No Data Found",
                      style: TextStyle(
                        fontFamily: "OpenSans",

                        fontWeight: FontWeight.w500,
                        color: kblack,
                      ),
                    ),
                  ),
                ):ListView.builder(
                  itemCount: kickData.length == 0 ? "" : kickData.length,
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
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(kickData[index]["stop_date"].toString(),
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600,
                                          color: kwhite,
                                        ),
                                      ),
                                      Text(kickData[index]["flag"].toString(),
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600,
                                          color: kwhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Count",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w700,
                                            color: kblack,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          kickData[index]["count"].toString(),
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w700,
                                            color: kblack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Start time",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w700,
                                            color: kblack,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          kickData[index]["start_time"].toString(),
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w500,
                                            color: kblack,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Duration",
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w700,
                                            color: kblack,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        kickData[index]["flag"].toString()=="active" ?
                                        StreamBuilder<Map<String, dynamic>>(
                                          stream: FlutterBackgroundService().onDataReceived,
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SpinKitWave(
                                                  color: buttonColor,
                                                  size: 12,
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
                                                color: kblack,
                                              ),
                                            );
                                          },
                                        ):
                                        Text(
                                          kickData[index]["duration"].toString(),
                                          style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.w500,
                                            color: kblack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if(kickData[index]["flag"].toString()=="active"){

                                      Navigator.of(context,rootNavigator: true).
                                      push(new MaterialPageRoute(builder: (_) => new kickSession_page()))
                                          .then((val)=>getKickData());

                                    }else{
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                          builder: (context) =>
                                              kickshowDetail_page(kickData[index]["unique_id"])));
                                    }
                                    },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Show detail   ",
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w500,
                                          color: buttonColor,
                                        ),
                                      ),
                                      Image.asset(
                                        "Assets/Icons/right_pink.png",
                                        height: 10,
                                      )
                                    ],
                                  ),
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
}
