import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/contractionHistory_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class contractionCounter_page extends StatefulWidget {
  @override
  _contractionCounter_pageState createState() =>
      _contractionCounter_pageState();
}

class _contractionCounter_pageState extends State<contractionCounter_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Contraction",
         appBar: AppBar(),
         widgets: [
           IconButton(
               onPressed: () {
                 Navigator.of(context, rootNavigator: true).push(
                     MaterialPageRoute(builder: (context) => contractionHistory_page()));
               },
               icon: Image.asset(
                 "Assets/Icons/history.png",
                 height: 15,
               ))
         ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "Assets/Icons/contraction_act.png",
                          height: 70,

                        ),
                        Text(
                          "Start Contraction",
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
                child: ListView.builder(
                  itemCount: 5,
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
                                offset:
                                    Offset(0, 1), // changes position of shadow
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last contraction information",
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600,
                                          color: kwhite,
                                          fontSize: 16
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
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
                                            "Start time : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            "03:06:07 PM",
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
                                            "Duration : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            "4 sec",
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
                                            "Interval : ",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w700,
                                              color: buttonColor,
                                            ),
                                          ),
                                          Text(
                                            "56 min 2 sec",
                                            style: TextStyle(
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.w500,
                                              color: kblack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
