import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/namesPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class babyNames_page extends StatefulWidget {
  @override
  _babyNames_pageState createState() => _babyNames_pageState();
}

class _babyNames_pageState extends State<babyNames_page>
    with TickerProviderStateMixin {
  final url1 = url.basicUrl;
  bool isLoading = true;
  List countryList = [];

  @override
  void initState() {
    super.initState();
    getCountryname();
  }

  Future<void> getCountryname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", null);
    prefs.setString("alphabet", null);

    var url = "$url1/countryList";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.get(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("country name " + responseJson.toString());

    setState(() {
      countryList = responseJson["data"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        appbartext: "Category",
        appBar: AppBar(),
      ),
      body: Container(
        child: isLoading
            ? SpinKitFadingFour(
                color: buttonColor,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              )
            : ListView.builder(
                itemCount: countryList == null ? "" : countryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15),
                    child: GestureDetector(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: kGray, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                countryList[index]["name"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w500),
                              ),
                              Image.asset(
                                "Assets/Icons/right_pink.png",
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(
                                builder: (context) =>
                                    namesPage(countryList[index]["id"])))
                            .then((value) {
                          setState(() {
                            getCountryname();
                          });
                        });
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
