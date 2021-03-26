import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/kick_Session_page.dart';

class kickCounter_page extends StatefulWidget {
  @override
  _kickCounter_pageState createState() => _kickCounter_pageState();
}

class _kickCounter_pageState extends State<kickCounter_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kick Counter"),
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(icon: Icon(Icons.info_outline_rounded), onPressed: () {})
          ],
        ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => kick_Session_page()));
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.orange[100],
                          Colors.purple[200],
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(2.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        size: 65,
                        color: Theme.of(context).accentColor,
                      ),
                      Text(
                        "Start New Session",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
