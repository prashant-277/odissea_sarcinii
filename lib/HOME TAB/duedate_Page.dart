import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class duedate_Page extends StatefulWidget {
  List dueDate;

  duedate_Page(this.dueDate);

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
            Row(
              children: [
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "Assets/Icons/back.png",
                    height: 15,
                    color: kwhite,
                  ),
                ),
              ],
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
                widget.dueDate[0]["date"].toString(),
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
                  "Congratulations! You are " + widget.dueDate[0]["week"].toString() + " week and " +widget.dueDate[0]["days"].toString() +" days pregnant.",
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
              height: MediaQuery.of(context).size.height / 2.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/shape.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 12),
                      Text(
                        widget.dueDate[0]["month"].toString(),
                        style: TextStyle(
                            color: kwhite,
                            fontFamily: "OpenSans",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                      widget.dueDate[0]["day"].toString(),
                    style: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(height: 10),
                  Text(
                    widget.dueDate[0]["year"].toString(),
                    style: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
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
