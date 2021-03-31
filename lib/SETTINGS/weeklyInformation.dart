import 'package:flutter/material.dart';

class weeklyInformation extends StatefulWidget {
  @override
  _weeklyInformationState createState() => _weeklyInformationState();
}

class _weeklyInformationState extends State<weeklyInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weekly Information"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width / 1.15,
                      color: Theme.of(context).accentColor,
                      child: Center(
                          child: Text(
                        "week $index",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 6,
                        color: Theme.of(context).backgroundColor,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 5, bottom: 5),
                              child: Container(
                                height: 85,
                                width: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45)),
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
