import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/addEssentials.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class newbornEssentials_page extends StatefulWidget {
  @override
  _newbornEssentials_pageState createState() => _newbornEssentials_pageState();
}

class _newbornEssentials_pageState extends State<newbornEssentials_page> {
  bool checkBoxValue = false;
  int selected = 0;

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
                      EdgeInsets.only(top: 10, left: 15, right: 5 , bottom: 20),
                  content: addEssentials()));
        },
        child: Image.asset("Assets/Icons/add.png"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: kwhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                color: buttonColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Clothing",
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                color: buttonColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Blankets",
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                color: buttonColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Feeding",
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
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 25,
                      child: IconButton(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            setState(() {
                              if (checkBoxValue == true) {
                                checkBoxValue = false;
                              } else {
                                checkBoxValue = true;
                              }
                            });
                          },
                          icon: Image.asset(
                            checkBoxValue
                                ? "Assets/Icons/check.png"
                                : "Assets/Icons/uncheck.png",
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Lorem Ipsum is simply dummy.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: kGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
