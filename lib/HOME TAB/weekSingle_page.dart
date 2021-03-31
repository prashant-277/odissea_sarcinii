import 'package:flutter/material.dart';

class weekSingle_page extends StatefulWidget {
  @override
  _weekSingle_pageState createState() => _weekSingle_pageState();
}

class _weekSingle_pageState extends State<weekSingle_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Week"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 150,
                      width: 150,
                      child: Container(
                        child: IconButton(
                            padding: EdgeInsets.all(0),
                            alignment: Alignment.bottomRight,
                            icon: Container(
                                height: 25,
                                width: 25,
                                color: Colors.purple[200],
                                child: Icon(Icons.search,
                                    color: Colors.white, size: 20)),
                            onPressed: () {}),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Baby Size',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '\n0 mm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54))
                              ]),
                        ),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                              text: 'Baby Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '\n0 g',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54))
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Saptamana 1 de sarcina",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.purple[100]),
                          ),
                          Column(
                            children: [
                              Icon(Icons.message_rounded,
                                  color: Colors.purple[100], size: 15),
                              Text('Forum',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18.0),
                    topLeft: Radius.circular(18.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Dear testhhhhy",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          child: Text(
                              "Not calling AlarmService.setPluginRegistrant will result in an exception being thrown when an alarm eventually fires. ")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Week Video",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          height: 150,
                          child: Image.asset(
                              "Assets/Images/video.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Baby Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          child: Text(
                              "Not calling AlarmService.setPluginRegistrant will result in an exception being thrown when an alarm eventually fires. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using.")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Mother Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          child: Text(
                              "Not calling AlarmService.setPluginRegistrant will result in an exception being thrown when an alarm eventually fires. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using.")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Extra Information",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.20,
                                child: Text(
                                    "Not calling AlarmService.setPluginRegistrant will result in an exception being thrown when an alarm eventually fires. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using.")),
                            Icon(Icons.arrow_forward_ios, color: Colors.purple[100]),
                          ],
                        ),
                        onTap: (){print("Extra Information");},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Tips",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.20,
                                child: Text(
                                    "Not calling AlarmService.setPluginRegistrant will result in an exception being thrown when an alarm eventually fires. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using.")),
                            Icon(Icons.arrow_forward_ios, color: Colors.purple[100]),
                          ],
                        ),
                        onTap: (){
                          print("Tips");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).accentColor,
                        child: Center(
                          child: Text(
                            "Symptoms",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.20,
                                child: Text(
                                    "For the Flutter Android Embedding V2, plugins are registered with the background isolate via reflection so AlarmService.setPluginRegistrant does not need to be called.")),
                            Icon(Icons.arrow_forward_ios, color: Colors.purple[100]),
                          ],
                        ),
                        onTap: (){print("Symptoms");},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
