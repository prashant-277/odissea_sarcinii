import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:odiseea_sarcinii/SETTINGS/feedbackPage.dart';
import 'package:odiseea_sarcinii/SETTINGS/nameDuedate.dart';
import 'package:odiseea_sarcinii/SETTINGS/prePregnancyweight.dart';
import 'package:odiseea_sarcinii/SETTINGS/recommendation.dart';
import 'package:odiseea_sarcinii/SETTINGS/weeklyInformation.dart';
import 'package:odiseea_sarcinii/Tabs/Baby_page.dart';
import 'package:odiseea_sarcinii/Tabs/Community_page.dart';
import 'package:odiseea_sarcinii/Tabs/Me_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';

import '../Tabs/Home_Page.dart';
import '../Tabs/Profile_page.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(choice),
                  arrowIcon(),
                ],
              ),
            );
          }).toList();
        },
        onSelected: (page) {
          if (page == "Name and Due Date") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => nameDuedate()));
          } else if (page == "Weekly Information") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => weeklyInformation()));
          } else if (page == "Pre-Pregnancy Weight") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => prePregnancyweight()));
          } else if (page == "Recommendation") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => recommendation()));
          } else if (page == "Remove advertisement") {
          } else if (page == "Feedback") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => feedbackPage()));
          }
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
}
