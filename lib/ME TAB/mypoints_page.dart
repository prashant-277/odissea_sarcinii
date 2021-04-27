import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class mypoints_page extends StatefulWidget {
  @override
  _mypoints_pageState createState() => _mypoints_pageState();
}

class _mypoints_pageState extends State<mypoints_page> {
  int sliderValue = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "My Points",
        appBar: AppBar(),
        widgets: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Image.asset(
                  "Assets/Images/vector.png",
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Your Earned Points",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w500,
                      color: kblack,
                      fontSize: 18),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Images/background_point.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text(
                    "90",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: kwhite,
                        fontSize: 70),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                          trackHeight: 15,
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 8.5, elevation: 0)),
                      child: Slider(
                        value: sliderValue.toDouble(),
                        max: 150.0,
                        min: 0.0,
                        activeColor: Color(0xFF00BB0C),
                        inactiveColor: kGray,
                        onChanged: (double newValue) {
                          setState(() {
                            sliderValue = newValue.round();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                            ),
                          ),
                          Text(
                            "90/150 POINTS",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kblack,
                                fontSize: 16),
                          ),
                          Text("150",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kblack,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
