import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';

class Profile_page extends StatefulWidget {
  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange[100],
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: listtiles(
                  text: "My Profile",
                  icon: Icons.person_rounded,
                  onTapped: () {},
                )),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: listtiles(
                  text: "Buy Credit",
                  icon: Icons.credit_card_rounded,
                  onTapped: () {},
                )),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: listtiles(
                  text: "Register / SignIn / SignOut",
                  icon: Icons.logout,
                  onTapped: () {},
                )),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: listtiles(
                  text: "Terms & Conditions",
                  icon: Icons.title_rounded,
                  onTapped: () {},
                ))
          ],
        ));
  }
}
