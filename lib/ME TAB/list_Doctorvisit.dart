import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class list_Doctorvisit extends StatefulWidget {
  @override
  _list_DoctorvisitState createState() => _list_DoctorvisitState();
}

class _list_DoctorvisitState extends State<list_Doctorvisit> with TickerProviderStateMixin{
  final url1 = url.basicUrl;
  List appointmentDetail = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAppointmentData();
  }

  Future<void> getAppointmentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/getDoctorList";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.get(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("Appontment list " + responseJson.toString());

    setState(() {
      appointmentDetail = responseJson["data"];
      isLoading = false;
    });
    if (responseJson["status"] == "Success") {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: isLoading
                ? SpinKitFadingFour(
              color: buttonColor,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            )
                : ListView.builder(
                itemCount:
                    appointmentDetail == null ? "" : appointmentDetail.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.85,
                      decoration: BoxDecoration(
                        border: Border.all(color: kGray),
                        color: kwhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            color: buttonColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    appointmentDetail[index]["appointment_date"]
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w600,
                                        color: kwhite,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Dr.Appointment : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["appointment_time"]
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Mood : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["mood"].toString() ==
                                          "null"
                                      ? "----"
                                      : appointmentDetail[index]["mood"]
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Energy : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["energy"]
                                              .toString() ==
                                          "null"
                                      ? "----"
                                      : appointmentDetail[index]["energy"]
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Appetite : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["appetite"]
                                              .toString() ==
                                          "null"
                                      ? "----"
                                      : appointmentDetail[index]["appetite"]
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Morning Sickness : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["sickness"]
                                              .toString() ==
                                          "null"
                                      ? "----"
                                      : appointmentDetail[index]["sickness"]
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Cravings : ",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  appointmentDetail[index]["craving"]
                                              .toString() ==
                                          "null"
                                      ? "----"
                                      : appointmentDetail[index]["craving"]
                                          .toString(),
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w500,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                          color: kblack,
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                      text: "Note : ",
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                          color: kblack,
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      text: appointmentDetail[index]["notes"]
                                                  .toString() ==
                                              "null"
                                          ? "----"
                                          : appointmentDetail[index]["notes"]
                                              .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
