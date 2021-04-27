import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odiseea_sarcinii/constants.dart';

class day_Doctorvisit extends StatefulWidget {
  @override
  _day_DoctorvisitState createState() => _day_DoctorvisitState();
}

class _day_DoctorvisitState extends State<day_Doctorvisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
        appBar: PreferredSize(
          preferredSize: Size(0, 40),
          child: SafeArea(
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(0),
              child: Container(
                color: Theme.of(context).backgroundColor,
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "delete",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 18,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {}),
                      Text(
                        "Today",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            Icons.info_outline_rounded,
                            size: 18,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0)),
                  ),
                  color: Colors.black26,
                  margin: EdgeInsets.only(top: 5, left: 0, right: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Measurements",
                          style: TextStyle(
                              fontSize: 17,
                              color: kwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Weight :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your weight",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 70,
                            child: Text(
                              "Waist : ",
                              textAlign: TextAlign.right,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 25,
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: TextField(
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration.collapsed(
                                border: InputBorder.none,
                                hintText: "Enter your waist",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 13),
                              ),
                              cursorColor: Theme.of(context).primaryColor,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white38,
                            ),
                            padding: EdgeInsets.only(left: 10, right: 10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 25,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "View Chart",
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0)),
                  ),
                  color: Colors.black26,
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Dr. Appointment",
                          style: TextStyle(
                              fontSize: 17,
                              color: kwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 00.0, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 5, left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 80,
                                child: Text(
                                  "Time : ",
                                  textAlign: TextAlign.right,
                                )),
                            Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Set Time",
                                  softWrap: true,
                                  style: TextStyle(color: kwhite),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.purple,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5, left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              child: Text(
                                "Remind Me : ",
                                softWrap: true,
                              ),
                            ),
                            Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Never",
                                  style: TextStyle(color: kwhite),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.purple,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0)),
                  ),
                  color: Colors.black26,
                  margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Feelings",
                          style: TextStyle(
                              fontSize: 17,
                              color: kwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Mood :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your mood",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Energy :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your energy",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Appetite :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your appetite",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Cravings :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your cravings",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 70,
                              child: Text(
                                "Sickness :",
                                textAlign: TextAlign.right,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: "Enter your sickness",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 13),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white38,
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0)),
                  ),
                  color: Colors.black26,
                  margin: EdgeInsets.only(top: 10, left: 0, right: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Other Notes & Questi...",
                          style: TextStyle(
                              fontSize: 17,
                              color: kwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10, bottom: 20, right: 30),
                  child: Container(
                    height: 100,
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 13),
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white38,
                    ),
                    padding: EdgeInsets.only(left: 10, right: 10),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
