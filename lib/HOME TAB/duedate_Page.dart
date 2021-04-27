import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class duedate_Page extends StatefulWidget {
  @override
  _duedate_PageState createState() => _duedate_PageState();
}

class _duedate_PageState extends State<duedate_Page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Images/background2.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Text(""),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("Assets/Icons/back.png", height: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "Your due date is",
                style: TextStyle(
                    color: kwhite,
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "January 4, 2022",
                style: TextStyle(
                    color: kwhite,
                    fontFamily: "OpenSans",
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 10, right: 10, bottom: 5),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  "Congratulations! You are 1 week pregnant.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kwhite,
                      fontFamily: "OpenSans",
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/shape.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "January",
                        style: TextStyle(
                            color: kwhite,
                            fontFamily: "OpenSans",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    "4",
                    style: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "2021",
                    style: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Recalculate your due date",
                  style: TextStyle(
                      color: kblack,
                      fontSize: 15,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                color: kwhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
