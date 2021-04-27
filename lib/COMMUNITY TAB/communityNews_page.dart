import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/COMMUNITY%20TAB/newsInner_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class communityNews_page extends StatefulWidget {
  @override
  _communityNews_pageState createState() => _communityNews_pageState();
}

class _communityNews_pageState extends State<communityNews_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "Community news",
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newsInner_page()));
              },
              title: Text(
                "Sarcina",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                    color: kblack,
                    fontSize: 15),
              ),
              trailing: Image.asset(
                "Assets/Icons/right_single.png",
                height: 15,
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
                      "Desprecopii.com news",
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
            ListTile(
              onTap: () {},
              title: Text(
                "Desprecopii.com Bebelusul",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                    color: kblack,
                    fontSize: 15),
              ),
              trailing: Image.asset(
                "Assets/Icons/right_single.png",
                height: 15,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Desprecopii Bebelusul",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                    color: kblack,
                    fontSize: 15),
              ),
              trailing: Image.asset(
                "Assets/Icons/right_single.png",
                height: 15,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Desprecopii Familie",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                    color: kblack,
                    fontSize: 15),
              ),
              trailing: Image.asset(
                "Assets/Icons/right_single.png",
                height: 15,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Desprecopii.com - General",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w500,
                    color: kblack,
                    fontSize: 15),
              ),
              trailing: Image.asset(
                "Assets/Icons/right_single.png",
                height: 15,
              ),
            ),
            Divider(
              endIndent: 10,
              indent: 10,
            )
          ],
        ),
      ),
    );
  }
}
