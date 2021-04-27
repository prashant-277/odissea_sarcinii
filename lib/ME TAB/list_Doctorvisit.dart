import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class list_Doctorvisit extends StatefulWidget {
  @override
  _list_DoctorvisitState createState() => _list_DoctorvisitState();
}

class _list_DoctorvisitState extends State<list_Doctorvisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                itemCount: 6,
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
                                    "22/Feb/2021",
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
                                  "Dr.Appointment :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " 11:56 AM",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Mood :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " Good",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Energy :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " Normal",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Appetite :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " Normal",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Morning Sickness :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " No",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Cravings :",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      color: kblack,
                                      fontSize: 15),
                                ),
                                Text(
                                  " ---",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, bottom: 10),
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
                                      text: "Note :",
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                          color: kblack,
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      text:
                                          " Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
