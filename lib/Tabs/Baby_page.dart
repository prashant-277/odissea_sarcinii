import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/babyNames_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/birthPlanner_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/contractionCounter_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kickCounter_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/newbornEssentials_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';
import 'package:odiseea_sarcinii/constants.dart';

class Baby_page extends StatefulWidget {
  @override
  _Baby_pageState createState() => _Baby_pageState();
}

class _Baby_pageState extends State<Baby_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/background_new_me.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(""),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Baby",
                  style: TextStyle(
                      color: kwhite,
                      fontSize: 25,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 1.37,
              child: ListView(padding: EdgeInsets.zero, children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                      text: "Baby Names",
                      imageName: "Assets/Icons/baby_name.png",
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => babyNames_page()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    onTapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => kickCounter_page()));
                    },
                    text: "Kick Counters",
                    imageName: "Assets/Icons/kick_counter.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    text: "Contraction Counters",
                    imageName: "Assets/Icons/contraction.png",
                    onTapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => contractionCounter_page()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    text: "Birth Planner",
                    imageName: "Assets/Icons/birth_planner.png",
                    onTapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => birthPlanner_page()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    text: "New Born Essentials",
                    imageName: "Assets/Icons/new_born.png",
                    onTapped: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newbornEssentials_page()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    text: "Birth Announcement",
                    onTapped: () {},
                    imageName: "Assets/Icons/my_week.png",
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
