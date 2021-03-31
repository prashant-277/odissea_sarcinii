import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/babyNames_page.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kickCounter_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';

class Baby_page extends StatefulWidget {
  @override
  _Baby_pageState createState() => _Baby_pageState();
}

class _Baby_pageState extends State<Baby_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                  text: "Baby Names",
                  icon: Icons.text_fields_rounded,
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
                  icon: Icons.assignment_outlined),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Contraction Counters",
                icon: Icons.timer,
                onTapped: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Birth Planner",
                icon: Icons.assignment_outlined,
                onTapped: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "New Born Essentials",
                icon: Icons.shopping_cart_outlined,
                onTapped: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Birth Announcement",
                onTapped: () {},
                icon: Icons.announcement_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
