import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:odiseea_sarcinii/ProfileDetails_Page.dart';
import 'package:odiseea_sarcinii/Tabs/Baby_page.dart';
import 'package:odiseea_sarcinii/Tabs/Community_page.dart';
import 'package:odiseea_sarcinii/Tabs/Me_page.dart';
import 'package:odiseea_sarcinii/setting.dart';
import 'package:popup_menu/popup_menu.dart';

import 'Home_Page.dart';
import 'Profile_page.dart';

class page extends StatelessWidget {
  final String title;

  const page({Key key, this.title})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Text(title);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        automaticallyImplyLeading: false,
        title: text,
        actions: <Widget>[showlastIcon(title, context)],
      ),
      body: Container(
        child: showPage(title.toString()),
      ),
    );
  }

  Widget showPage(title) {
    if (title.toString() == "Home") {
      return Container(
        child: Home_Page(),
      );
    } else if (title.toString() == "Me") {
      return Container(
        child: Me_page(),
      );
    } else if (title.toString() == "Baby") {
      return Container(
        child: Baby_page(),
      );
    } else if (title.toString() == "Community") {
      return Container(
        child: Community_page(),
      );
    } else if (title.toString() == "Profile") {
      return Container(
        child: Profile_page(),
      );
    }
  }

  Widget showlastIcon(String title, BuildContext context) {
    if (title == "Home") {
      return PopupMenuButton<String>(
        onSelected: handleClick,
        icon: Icon(Icons.settings_applications_outlined),
        itemBuilder: (BuildContext context) {
          return {
            'Name and Due Date',
            'Weekly Information',
            'Pre-Pregnancy Weight',
            'Recommendation',
            'Remove advertisement',
            'Feedback',
          }.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(choice),
                  Container(
                      height: 15,
                      width: 15,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ],
              ),
            );
          }).toList();
        },
        color: Colors.orange[100],
      );
    } else if (title == "Me") {
      return Container();
    } else if (title == "Baby") {
      return Container();
    } else if (title == "Community") {
      return Container();
    } else if (title == "Profile") {
      return Container();
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Name and Due Date':
        print("Name and Due Date");
        break;
      case 'Weekly Information':
        print("Weekly Information");
        break;
      case 'Pre-Pregnancy Weight':
        print("Pre-Pregnancy Weight");
        break;
      case 'Recommendation':
        print("Recommendation");
        break;
      case 'Remove advertisement':
        print("Remove advertisement");
        break;
      case 'Feedback':
        print("Feedback");
        break;
    }
  }
}
