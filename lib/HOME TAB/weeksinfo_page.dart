import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class weeksinfo_page extends StatefulWidget {
  @override
  _weeksinfo_pageState createState() => _weeksinfo_pageState();
}

class _weeksinfo_pageState extends State<weeksinfo_page> {
  PageController pageController = PageController(initialPage: 0);

  int newvalue = 0;

  RangeValues _currentRangeValues = const RangeValues(1, 270);
  RangeLabels labels = RangeLabels("1", "270");

  int sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "Assets/Icons/back.png",
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Week $newvalue",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          backgroundColor: statusbarColor,
          actions: [
            IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Image.asset(
                  "Assets/Icons/up.png",
                  height: 10,
                ),
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.bounceInOut);
                }),
            IconButton(
                icon: Image.asset(
                  "Assets/Icons/down_single.png",
                  height: 10,
                ),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                })
          ],
        ),
        body: Container(
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            reverse: false,
            allowImplicitScrolling: false,
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: 42,
            onPageChanged: changeWeek,
            itemBuilder: (context, position) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Assets/Images/main_img.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.10,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          RangeSlider(
                            values: _currentRangeValues,
                            min: 0,
                            max: 270,
                            divisions: 270,
                            activeColor: buttonColor,
                            inactiveColor: Colors.redAccent[200],
                            labels: labels,
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                                labels = RangeLabels(
                                    _currentRangeValues.start.toString(),
                                    _currentRangeValues.end.toString());
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Baby size",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "OpenSans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "350mm",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "OpenSans",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.black12,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Baby Weight",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "OpenSans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "1200 g",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "OpenSans",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: primarybutton(
                              "$newvalue weeks of pregnancy", () {})),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/dear_cosmina.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Dear cosmina stratan",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/video.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Week $newvalue Video",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 4.2,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/video_back.png",
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        "Assets/Icons/video.png",
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/baby_bw.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Baby Information",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/mother.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Mother Information",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/info.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Extra Information",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/tips.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Tips",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/background3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      "Assets/Icons/symptoms.png",
                                      height: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8.0, top: 5.0),
                                    child: Text(
                                      "Symptoms",
                                      style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              );
            },
          ),
        ));
  }

  void changeWeek(int value) {
    print(value);
    setState(() {
      newvalue = value;
    });
  }
}
