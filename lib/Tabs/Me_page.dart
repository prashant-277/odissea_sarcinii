import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weekSingle_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/doctorVisit_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weight_tracker.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';

import '../ME TAB/myPhotos_page.dart';

class Me_page extends StatelessWidget {
  final String title;

  const Me_page({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(00.0),
            child: listtiles(
              text: "My Week",
              icon: Icons.calendar_today,
              onTapped: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => weekSingle_page()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              text: "My Journal",
              icon: Icons.assignment_outlined,
              onTapped: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              text: "My Questions",
              icon: Icons.question_answer_outlined,
              onTapped: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              text: "My Groups",
              icon: Icons.group_rounded,
              onTapped: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              onTapped: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myPhotos_page()));
              },
              text: "My Photos",
              icon: Icons.photo_library_outlined,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => doctorVisit_page()));
                },
                text: "Doctor Visit",
                icon: Icons.local_hospital_outlined,
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              onTapped: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => weight_tracker()));
              },
              text: "Weight Tracker",
              icon: Icons.timelapse_outlined,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: listtiles(
                text: "Plan Online Consultation",
                icon: Icons.book_online,
                onTapped: () {},
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: listtiles(
              text: "My Points",
              icon: Icons.point_of_sale,
              onTapped: () {},
            ),
          ),
          /*FlutterSlider(
            values: [300],
            max: 500,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {},
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(),
              child: Material(
                type: MaterialType.canvas,
                color: Colors.orange,
                elevation: 3,
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80")),
              ),
            ),
            jump: true,
            touchSize: 50,
          )*/
        ],
      )),
    );
  }
}
