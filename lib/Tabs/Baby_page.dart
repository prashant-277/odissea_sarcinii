import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kickCounter_page.dart';

class Baby_page extends StatefulWidget {
  @override
  _Baby_pageState createState() => _Baby_pageState();
}

class _Baby_pageState extends State<Baby_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("Baby Names"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.text_fields_rounded,
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>kickCounter_page()));
              },
              title: Text("Kick Counters"),
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
              title: Text("Contraction Counters"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.timer,
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
              title: Text("Birth Planner"),
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
              title: Text("New Born Essentials"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.shopping_cart_outlined,
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
              title: Text("Birth Announcements"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.announcement_outlined,
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
        ],
      ),
    );
  }
}
