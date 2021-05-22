import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kickDetail_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kick_Session_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class kickCounter_page extends StatefulWidget {
  @override
  _kickCounter_pageState createState() => _kickCounter_pageState();
}

class _kickCounter_pageState extends State<kickCounter_page> {
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
                                      Text(
                                        "09 April 2021",
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600,
                                          color: kwhite,
                                        ),
                                      ),
                                      Text(
                                        "Completed",
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
                                          "7",
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
                                          "03:06:07 PM",
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
                                        Text(
                                          "0:0:27",
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
                                padding: const EdgeInsets.only(top:5,bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) => kickDetail_page()));
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
