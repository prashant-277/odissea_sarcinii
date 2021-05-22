import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/nameFilter_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class namesPage extends StatefulWidget {
  var countryId;

  namesPage(this.countryId);

  @override
  _namesPageState createState() => _namesPageState();
}

class _namesPageState extends State<namesPage> with TickerProviderStateMixin {
  final url1 = url.basicUrl;
  bool isLoading = true;
  List babyname = [];

  @override
  void initState() {
    super.initState();
    getnames();
  }

  Future<void> getnames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("gender1 " + prefs.getString("gender").toString());
    print("alphabet2 " + prefs.getString("alphabet").toString());

    var url = "$url1/kidsList";

    var map = new Map<String, dynamic>();
    map["country_id"] = widget.countryId.toString();

    prefs.getString("gender") == null
        ? ""
        : map["gender"] = prefs.getString("gender").toString();
    //   map["gender"] = prefs.getString("gender").toString();
    prefs.getString("alphabet") == null
        ? ""
        : map["search"] = prefs.getString("alphabet").toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("baby name " + responseJson.toString());
    setState(() {
      babyname = responseJson["data"];
      isLoading = false;
    });

    if (responseJson["status"] == "Success") {
      isLoading = false;
    } else {
      isLoading = false;
      displayToast("No name found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Name",
        appBar: AppBar(),
        widgets: [
          IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                        builder: (context) => nameFilter_page()))
                    .then((value) {
                  setState(() {
                    getnames();
                  });
                });
              },
              icon: Image.asset(
                "Assets/Icons/filter.png",
                height: 15,
              ))
        ],
      ),
      body: Container(
        color: kwhite,
        child: isLoading
            ? SpinKitFadingFour(
                color: buttonColor,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              )
            : ListView.builder(
                itemCount: babyname == null ? "" : babyname.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15),
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
                              babyname[index]["name"].toString(),
                              style: TextStyle(
                                  color: kblack,
                                  fontSize: 15,
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
