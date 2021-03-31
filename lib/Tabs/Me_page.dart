import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weekSingle_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/doctorVisit_page.dart';
import 'package:odiseea_sarcinii/ME%20TAB/weight_tracker.dart';

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
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("My Week"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => weekSingle_page()));
              },
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("My Journal"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.assignment_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("My Questions"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.question_answer_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("My Groups"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.group_rounded,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myPhotos_page()));
              },
              title: Text("My Photos"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => doctorVisit_page()));
              },
              title: Text("Doctor Visit"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.local_hospital_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => weight_tracker()));
              },
              title: Text("Weight Tracker"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.timelapse_outlined,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Plan Online Consultation"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.book_online,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
            ),
          ),
          Divider(
            color: Colors.black45,
            indent: MediaQuery.of(context).size.width / 4.0,
            endIndent: MediaQuery.of(context).size.width / 6.5,
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("My Points"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.point_of_sale,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                        width: 1, color: Theme.of(context).accentColor),
                    color: Colors.white,
                  )),
              trailing: Container(
                  height: 20,
                  width: 20,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Theme.of(context).accentColor,
                  )),
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
