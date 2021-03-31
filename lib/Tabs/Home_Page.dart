import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/weeksinfo_page.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.orange[100],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "Assets/Images/profile_upload.png",
                      color: Colors.black38,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "No Name",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "42 week & 2 days",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(
                              "- - - - -",
                              style: TextStyle(color: Colors.black45),
                            ),
                            Container(
                              height: 27,
                              width: 100,
                              child: Center(
                                child: Text(
                                  "Edit Your Info.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Your Baby is : ",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Stack(
              children: [
                Card(
                  color: Colors.orange[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0)),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                Align(
                  alignment: Alignment(0.8, -1.15),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                        border:
                            Border.all(color: Colors.orange[200], width: 6)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "43",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "weeks",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "data",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 45.0, left: 20, right: 20, bottom: 105),
                  child: SingleChildScrollView(
                    child: GestureDetector(
                      child: Text(
                          "If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using. If alarm callbacks will need access to other Flutter plugins, including the alarm manager plugin itself, it may be necessary to inform the background service how to initialize plugins depending on which Flutter Android embedding the application is using.",
                          style: TextStyle(fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> weeksinfo_page()));
                      },
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment(0.9, 0.35),
                    child: Container(
                      color: Colors.orange[200],
                      child: Text(
                        "My Weeks",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).accentColor,
                              ),
                              color: Colors.orange[200],
                              height: MediaQuery.of(context).size.height / 8),
                          onTap: () {
                            _scrollController.animateTo(
                                _scrollController.position.minScrollExtent,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 5000));
                          },
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 1.5,
                          color: Colors.orange[200],
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: Colors.black38,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0.6),
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        child: Center(child: Text("$index")),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                              color: Colors.black38, width: 1),
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                              color: Colors.orange[200],
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Theme.of(context).accentColor,
                              ),
                              height: MediaQuery.of(context).size.height / 8),
                          onTap: () {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 5000),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
