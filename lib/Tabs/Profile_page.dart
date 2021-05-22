import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:odiseea_sarcinii/PROFILE%20TAB/changepassword.dart';
import 'package:odiseea_sarcinii/PROFILE%20TAB/profile_page.dart';
import 'package:odiseea_sarcinii/PROFILE%20TAB/termsandcondition.dart';
import 'package:odiseea_sarcinii/Registration/RegistrationPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_page extends StatefulWidget {
  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  final url1 = url.basicUrl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Images/background_new_me.png"),
                fit: BoxFit.fill,
              ),
              color: kwhite),
          child: Column(
            children: [
              Text(""),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      "Profile",
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
                          text: "My Profile",
                          imageName: "Assets/Icons/my_profile.png",
                          onTapped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profile_page()));
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listtiles(
                          text: "Buy Credit",
                          imageName: "Assets/Icons/buy_credit.png",
                          onTapped: () {},
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listtiles(
                          text: "Terms & Conditions",
                          imageName: "Assets/Icons/terms.png",
                          onTapped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => termsandcondition()));
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: listtiles(
                          text: "Change password",
                          imageName: "Assets/Icons/change_pw.png",
                          onTapped: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => changepassword()));
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: FlatButton(
                          color: kwhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: buttonColor,
                                fontSize: 18,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            print(prefs.getString("apiToken").toString());
                            var url = "$url1/logout";

                            Map<String, String> header = {
                              "Authorization": prefs.getString("apiToken").toString()
                            };

                            final response = await http.get(Uri.parse(url), headers: header);

                            final responseJson = json.decode(response.body);
                            print("weight tracker "  + responseJson.toString());

                            if(responseJson["status"].toString()=="Success"){
                              displayToast(responseJson["message"].toString());

                              prefs.setString("userEmail", null);
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(builder: (context) => RegistrationPage()));

                            }else{}
                          },
                          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
