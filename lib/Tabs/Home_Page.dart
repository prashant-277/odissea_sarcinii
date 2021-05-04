import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/dobCalculatorPage.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/myweekTimeline.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weeksinfo_page.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  RangeLabels labels = RangeLabels("Day 1", "Day 270");

  int sliderValue1 = 142;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Images/background_crop2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(""),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15),
                      child: Row(
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 25,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: kwhite,
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
                                  color: kwhite,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.95,
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
                                                color: kblack,
                                                fontFamily: "OpenSans",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "20 week & 2 days",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: kblack,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Your baby is 520 mm & 1250 g",
                                            style: TextStyle(
                                                fontFamily: "OpenSans",
                                                color: kblack,
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
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      child:
                                                          dobCalculatorPage()));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: Container(
                                                height: 27,
                                                width: 110,
                                                child: Center(
                                                  child: Text(
                                                    "EDOB Calculator",
                                                    style: TextStyle(
                                                        color: kwhite,
                                                        fontFamily: "OpenSans",
                                                        fontSize: 10),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  color: buttonColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.19,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: buttonColor,
                                    border:
                                        Border.all(color: kwhite, width: 4)),
                              ),
                              SliderTheme(
                                  data: SliderThemeData(
                                      trackHeight: 6,
                                      thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 3.0,
                                          elevation: 0),
                                      thumbColor: buttonColor,
                                      showValueIndicator:
                                          ShowValueIndicator.always,
                                      activeTrackColor: kwhite,
                                      inactiveTrackColor: Colors.red,
                                      valueIndicatorColor: kwhite,
                                      valueIndicatorTextStyle: TextStyle(
                                          color: buttonColor,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600),
                                      valueIndicatorShape:
                                          PaddleSliderValueIndicatorShape(),
                                      trackShape: CustomTrackShape(),
                                      overlayColor: Colors.transparent),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.55,
                                    child: Slider(
                                        value: sliderValue1.toDouble(),
                                        min: 1,
                                        max: 270,
                                        divisions: 270,
                                        activeColor: kwhite,
                                        inactiveColor: Colors.red[700],
                                        label:
                                            'Day ' + '${sliderValue1.round()}',
                                        onChanged: (double newValue) {
                                          setState(() {
                                            sliderValue1 = newValue.round();
                                          });
                                        },
                                        semanticFormatterCallback:
                                            (double newValue) {
                                          return '${newValue.round()}';
                                        }),
                                  )),
                              Container(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    color: buttonColor,
                                    border: Border.all(
                                        color: Colors.red[700], width: 4)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Jan 1",
                                style: TextStyle(
                                    color: kwhite,
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "oct 28",
                                style: TextStyle(
                                    color: kwhite,
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
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
              Container(
                height: MediaQuery.of(context).size.height / 4.0,
                width: MediaQuery.of(context).size.width,
                color: kwhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(
                      "20 weeks of \nPregnancy",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Container(
                      child: Image.asset(
                        "Assets/Images/img2.png",
                        height: 125,
                        width: 125,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: kwhite,
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
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: Container(
                        child: Text(
                          "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 15,
                              color: kwhite),
                          maxLines: 10,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          "Read more...",
                          style: TextStyle(
                              color: kwhite,
                              fontFamily: "OpenSans",
                              fontSize: 14),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  alignment: Alignment.bottomCenter,
                                  duration: Duration(milliseconds: 300),
                                  child: weeksinfo_page()));
                        },
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
                                            color: kblack38,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: kwhite,
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
                                                  color: kblack38,
                                                  width: 1),
                                              color: kwhite,
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
                                color: kwhite,
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
                            PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(milliseconds: 300),
                                child: myweekTimeline()));
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

class CustomTrackShape extends RectangularSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
