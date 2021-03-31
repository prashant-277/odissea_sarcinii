import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("News"),
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
              title: Text("Wall"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.group_add_rounded,
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
              title: Text("Forum"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.message_outlined,
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
              title: Text("Groups"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.group,
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
              title: Text("Message"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.message_rounded,
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
              title: Text("Store"),
              leading: Container(
                  height: 60,
                  width: 60,
                  child: Icon(
                    Icons.store,
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
