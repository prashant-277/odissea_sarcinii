import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/ME%20TAB/addweightDetail.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';

class weightListpage extends StatefulWidget {
  @override
  _weightListpageState createState() => _weightListpageState();
}

class _weightListpageState extends State<weightListpage> with TickerProviderStateMixin{
  List weightList = [];
  bool isLoading = true;
  final url1 = url.basicUrl;



  @override
  void initState() {
    super.initState();
    getweightlist();
  }

  Future<void> getweightlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/getWeightList";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.get(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("weight tracker "  + responseJson.toString());

    setState(() {
      weightList = responseJson["data"];
      isLoading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Image.asset("Assets/Icons/add.png"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                    backgroundColor: kwhite,
                    content: Hero(tag: "dialoghero",
                        child: addweightDetail()))).then((value) => getweightlist());
            /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => addweightDetail()));*/
          },
        ),
        body: isLoading
            ? SpinKitFadingFour(
          color: buttonColor,
          controller: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 1200)),
        )
            : ListView.builder(
          itemCount: weightList == null ? "" : weightList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5.5,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Start weight",
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: kwhite,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 0.5,
                                color: kwhite,
                              ),
                              Text(
                                "Current weight",
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: kwhite,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 0.5,
                                color: kwhite,
                              ),
                              Text(
                                "Change",
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  weightList[index]["start_weight"].toString() + " kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Week "+ weightList[index]["start_week"].toString(),
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 0.5,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                            weightList[index]["current_weight"].toString() + " kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Week "+ weightList[index]["current_week"].toString(),
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 0.5,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                                  weightList[index]["change_weight"].toString() + " kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Change",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text("")
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
