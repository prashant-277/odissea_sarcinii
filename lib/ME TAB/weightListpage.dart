import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/ME%20TAB/addweightDetail.dart';
import 'package:odiseea_sarcinii/constants.dart';

class weightListpage extends StatefulWidget {
  @override
  _weightListpageState createState() => _weightListpageState();
}

class _weightListpageState extends State<weightListpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Image.asset("Assets/Icons/add.png"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                    backgroundColor: kwhite, content: addweightDetail()));
            /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => addweightDetail()));*/
          },
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5.5,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Start weight",
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: kwhite,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 0.5,
                                color: kwhite,
                              ),
                              Text(
                                "Current weight",
                                style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: kwhite,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 0.5,
                                color: kwhite,
                              ),
                              Text(
                                "Change",
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "51.4 kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Week 21",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 0.5,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                                  "58.8 kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Week 31",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 0.5,
                              color: kwhite,
                            ),
                            Column(
                              children: [
                                Text(
                                  "7.4 kg",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kblack,
                                  ),
                                ),
                                Text(
                                  "Change",
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: buttonColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text("")
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
