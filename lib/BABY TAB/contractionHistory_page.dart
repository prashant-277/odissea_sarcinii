import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class contractionHistory_page extends StatefulWidget {
  @override
  _contractionHistory_pageState createState() =>
      _contractionHistory_pageState();
}

class _contractionHistory_pageState extends State<contractionHistory_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "History",
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => kick_Session_page()));*/
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Average Interval : ",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                color: kwhite,
                              ),
                            ),
                            Text(
                              "00:37:26",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Average duration : ",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                color: kwhite,
                              ),
                            ),
                            Text(
                              "00:0:26",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Average stage : ",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600,
                                color: kwhite,
                              ),
                            ),
                            Text(
                              "First stage",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kwhite,
                              ),
                            ),
                          ],
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
                  //height: MediaQuery.of(context).size.height / 2.0,
                  child: Container(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Contraction history",
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w600,
                                      color: kwhite,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.0,
                          child: ListView.builder(
                              itemCount: 6,
                              itemBuilder: (context, Index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              (Index + 1).toString() + ". ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: kblack,
                                              ),
                                            ),
                                            Text(
                                              "Start time : ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: buttonColor,
                                              ),
                                            ),
                                            Text(
                                              "04:03:26 PM",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w500,
                                                color: kblack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              (Index + 1).toString() + ". ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Text(
                                              "End time : ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: buttonColor,
                                              ),
                                            ),
                                            Text(
                                              "04:10:34 PM",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w500,
                                                color: kblack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              (Index + 1).toString() + ". ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Text(
                                              "Duration : ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: buttonColor,
                                              ),
                                            ),
                                            Text(
                                              "00:00:12",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w500,
                                                color: kblack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              (Index + 1).toString() + ". ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Text(
                                              "Interval : ",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w700,
                                                color: buttonColor,
                                              ),
                                            ),
                                            Text(
                                              "00:00:00",
                                              style: TextStyle(
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w500,
                                                color: kblack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
