import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class myweekTimeline extends StatefulWidget {
  @override
  _myweekTimelineState createState() => _myweekTimelineState();
}

class _myweekTimelineState extends State<myweekTimeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/background2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(""),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            Image.asset("Assets/Icons/back.png", height: 15)),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Week",
                                    style: TextStyle(
                                        color: kwhite,
                                        fontFamily: "OpenSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: kwhite,
                                        fontFamily: "OpenSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    width: 0.2,
                                    color: kwhite,
                                    height: 100,
                                  ),
                                  SizedBox(height: 10)
                                ],
                              ),
                              GestureDetector(
                                child: Hero(
                                  tag: 'imageHero',
                                  child: Image.asset(
                                    "Assets/Images/group1587.png",
                                    height: 130,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return DetailScreen();
                                  }));
                                },
                              ),
                              Image.asset(
                                "Assets/Images/group1589.png",
                                height: 130,
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                  ],

                )
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                contentPadding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                  backgroundColor: kwhite, content: uploadDialog()));
        },
        child: Image.asset("Assets/Icons/add.png"),
      ),
    );
  }

  Widget uploadDialog() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add new image",
                style: TextStyle(
                    color: kblack,
                    fontFamily: "OpenSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  icon: Image.asset(
                    "Assets/Icons/cancel.png",
                    height: 15,
                  ))
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4.0,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26, width: 0.5)),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "Assets/Images/new_img.png",
                height: 75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: primarybutton("Upload", () {})),
          )
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "Assets/Icons/back.png",
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Week",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Image.asset(
                "Assets/Icons/share.png",
                height: 15,
              ))
        ],
        elevation: 0,
        backgroundColor: statusbarColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(
              "Assets/Images/group1587.png",
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                      backgroundColor: kwhite,
                      content: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add new image",
                                  style: TextStyle(
                                      color: kblack,
                                      fontFamily: "OpenSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog');
                                    },
                                    icon: Image.asset(
                                      "Assets/Icons/cancel.png",
                                      height: 15,
                                    ))
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.0,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.black26, width: 0.5)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "Assets/Images/new_img.png",
                                  height: 75,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: primarybutton("Upload", () {})),
                            )
                          ],
                        ),
                      )
                  ));
            },
            child: Image.asset("Assets/Icons/add.png"),
          ),
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Image.asset("Assets/Icons/delete.png"),
          ),
        ],
      ),
    );
  }
}
