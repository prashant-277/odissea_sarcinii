import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/addEssentials.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class newbornEssentials_page extends StatefulWidget {
  @override
  _newbornEssentials_pageState createState() => _newbornEssentials_pageState();
}

class _newbornEssentials_pageState extends State<newbornEssentials_page>
    with TickerProviderStateMixin {
  bool checkBoxValue = false;
  final url1 = url.basicUrl;
  List essentialPlanList = [];
  bool isLoading = true;
  int selected = 0;

  @override
  void initState() {
    super.initState();
    getessential("","",null);
  }

  Future<void> getessential(String type_data, String flag, int essentialid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/getessentialList";


    print(type_data.toString().toString());
    print(flag.toString());
    print(essentialid.toString().toString());


    var map = new Map<String, dynamic>();
    map["type"] = type_data.toString();
    map["essential_id"] =  essentialid.toString();
    map["flag"] = flag.toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header,body: map);

    final responseJson = json.decode(response.body);
    print("getessentialList " + responseJson.toString());

    setState(() {
      setState(() {
        isLoading = false;
      });
      essentialPlanList = responseJson["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Essential",
        appBar: AppBar(),
        widgets: [
          Container(
            padding: EdgeInsets.zero,
            width: 30,
            child: IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(3),
                onPressed: () {
                  setState(() {
                    if (selected == 0) {
                      selected = 1;
                    } else {
                      selected = 0;
                    }
                  });
                },
                icon: Image.asset(
                  selected == 0
                      ? "Assets/Icons/selected.png"
                      : "Assets/Icons/all.png",
                )),
          ),
          SizedBox(width: 5),
          Container(
            padding: EdgeInsets.zero,
            width: 30,
            child: IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(3),
                onPressed: () {
                  print("email");
                },
                icon: Image.asset(
                  "Assets/Icons/email_act.png",
                )),
          ),
          SizedBox(width: 5)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                  backgroundColor: kwhite,
                  contentPadding:
                      EdgeInsets.only(top: 10, left: 15, right: 5, bottom: 20),
                  content: addEssentials())).then((value) => getessential("","",null));
        },
        child: Image.asset("Assets/Icons/add.png"),
      ),
      body: isLoading
          ? SpinKitFadingFour(
              color: buttonColor,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            )
          : essentialPlanList.toString() == "[]"
              ? Center(
                  child: Container(
                  child: Text(
                    "No data found",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: kblack,
                        fontSize: 15),
                  ),
                ))
              : Container(
                  width: MediaQuery.of(context).size.width,
                  color: kwhite,
                  child: ListView.builder(
                      itemCount: essentialPlanList == null
                          ? ""
                          : essentialPlanList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            essentialPlanList[index]["description"]
                                        .toString() == "[]"
                                ? Container()
                                : Container(
                                    height:
                                        MediaQuery.of(context).size.height / 14,
                                    width: MediaQuery.of(context).size.width,
                                    color: buttonColor,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            essentialPlanList[index]["title"]
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w600,
                                                color: kwhite,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: essentialPlanList[index]
                                            ["description"] ==
                                        null
                                    ? ""
                                    : essentialPlanList[index]["description"]
                                        .length,
                                itemBuilder: (context, index1) {
                                  return Dismissible(
                                    direction: DismissDirection.endToStart,
                                    background: Container(
                                      height: 50,
                                        width: MediaQuery.of(context).size.width,
                                        color: Colors.red,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(right:10.0),
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  fontFamily: "OpenSans",
                                                  fontWeight: FontWeight.w600,
                                                  color: kwhite,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        )),
                                    onDismissed: (direction) async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      var url = "$url1/deleteessential";

                                      var map = new Map<String, dynamic>();
                                      map["desc_id"] =  essentialPlanList[index]["description"][index1]["id"].toString();


                                      Map<String, String> header = {
                                        "Authorization": prefs.getString("apiToken").toString()
                                      };

                                      final response = await http.post(Uri.parse(url),
                                          headers: header, body: map);

                                      final responseJson = json.decode(response.body);
                                      print("essential delete " + responseJson.toString());
                                      if (responseJson["status"] == "Success") {
                                        setState(() {
                                          getessential("","",null);
                                        });
                                      }else{
                                        displayToast(responseJson["message"].toString());
                                      }
                                    },
                                    key: UniqueKey(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.zero,
                                            width: 25,
                                            child: IconButton(
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.all(3),
                                                onPressed: () {
                                                  setState(() {
                                                    if (checkBoxValue == true) {
                                                      checkBoxValue = false;
                                                      setState(() {
                                                        getessential("add_data","0",essentialPlanList[index]["description"][index1]["id"]);
                                                      });
                                                    } else {
                                                      checkBoxValue = true;
                                                      setState(() {
                                                        getessential("add_data","1",essentialPlanList[index]["description"][index1]["id"]);
                                                      });
                                                    }
                                                  });
                                                },
                                                icon: Image.asset(
                                                  essentialPlanList[index]
                                                  ["description"][index1]["flag"]==0
                                                      ? "Assets/Icons/check.png"
                                                      : "Assets/Icons/uncheck.png",
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                                essentialPlanList[index]
                                                            ["description"]
                                                        [index1]["description"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: "OpenSans",
                                                    fontWeight: FontWeight.w500,
                                                    color: kblack,
                                                    fontSize: 15)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        );
                      })),
    );
  }
}
