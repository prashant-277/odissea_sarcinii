import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/namesPage.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class babyNames_page extends StatefulWidget {
  @override
  _babyNames_pageState createState() => _babyNames_pageState();
}

class _babyNames_pageState extends State<babyNames_page> {
  String name = "Name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        appbartext: "Category",
        appBar: AppBar(),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kGray, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name.toString() + " $index",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          "Assets/Icons/right_pink.png",
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => namesPage(name)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
