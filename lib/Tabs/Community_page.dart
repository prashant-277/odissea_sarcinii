import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';

class Community_page extends StatefulWidget {
  @override
  _Community_pageState createState() => _Community_pageState();
}

class _Community_pageState extends State<Community_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "News",
                icon: Icons.assignment_outlined,
                onTapped: () {},
              )),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Wall",
                icon: Icons.group_add_rounded,
                onTapped: () {},
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              text: "Forum",
              icon: Icons.message_outlined,
              onTapped: () {},
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Groups",
                icon: Icons.group,
                onTapped: () {},
              )),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Message",
                icon: Icons.message_rounded,
                onTapped: () {},
              )),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Store",
                icon: Icons.store,
                onTapped: () {},
              ))
        ],
      ),
    );
  }
}
