import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/dobCalculatorPage.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/myweekTimeline.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weeksinfo_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  RangeValues _currentRangeValues = const RangeValues(1, 270);
  RangeLabels labels = RangeLabels("1", "270");

  int sliderValue = 270;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "Assets/Images/background_crop2.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "Assets/Images/img.png",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: MediaQuery.of(context).size.width /
                                        1.85,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Cosmina stratan",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "20 week & 2 days",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Your baby is 520mm & 1250g",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          dobCalculatorPage()));
                                            },
                                            child: Container(
                                              height: 28,
                                              width: 120,
                                              child: Center(
                                                child: Text(
                                                  "EDOB Calculator",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: "OpenSans",
                                                      fontSize: 12),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.19,
                          child: Column(
                            children: [
                              SizedBox(height: 40),
                              RangeSlider(
                                values: _currentRangeValues,
                                min: 0,
                                max: 270,
                                divisions: 270,
                                activeColor: Colors.white,
                                inactiveColor: buttonColor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Jan 1",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "OpenSans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "oct 28",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "OpenSans",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    "Assets/Icons/down.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(""),
                    Text(
                      "20 weeks of \nPregnancy",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          fontSize: 22),
                    ),
                    Container(
                      child: Image.asset(
                        "Assets/Images/img2.png",
                        height: 125,
                        width: 125,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.white,
                      ),
                    ),
                    Text(""),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Images/background3.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        child: GestureDetector(
                          child: Container(
                            child: Text(
                              "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontSize: 15,
                                  color: Colors.white),
                              maxLines: 10,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => weeksinfo_page()));
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => weeksinfo_page()));
                          },
                          child: Text(
                            "Read more...",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "OpenSans",
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    /*Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        elevation: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  color: Colors.orange[200],
                                  height:
                                      MediaQuery.of(context).size.height / 8),
                              onTap: () {
                                _scrollController.animateTo(
                                    _scrollController.position.minScrollExtent,
                                    curve: Curves.fastOutSlowIn,
                                    duration:
                                        const Duration(milliseconds: 5000));
                              },
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 1.5,
                              color: Colors.orange[200],
                              child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            color: Colors.black38,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0, 0.6),
                                        child: Container(
                                            height: 20,
                                            width: 20,
                                            child:
                                                Center(child: Text("$index")),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              border: Border.all(
                                                  color: Colors.black38,
                                                  width: 1),
                                              color: Colors.white,
                                            )),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                  color: Colors.orange[200],
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 8),
                              onTap: () {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 5000),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: FlatButton(
                      color: buttonColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "Assets/Icons/right.png",
                            height: 0,
                            width: 0,
                          ),
                          Text(
                            "My week timeline",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            "Assets/Icons/right.png",
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => myweekTimeline()));
                      },
                      padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
