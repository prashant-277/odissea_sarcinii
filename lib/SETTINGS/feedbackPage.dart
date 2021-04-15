import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class feedbackPage extends StatefulWidget {
  @override
  _feedbackPageState createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  var feedbackcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Feedback"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter Your Feedback Here:",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,bottom: 5,top: 15),
              child: Row(
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.only(left: 5, right: 10)),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,bottom: 5,top: 15),
              child: Row(
                children: [
                  Text(
                    "Message:",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.only(left: 5, right: 10)),

            Padding(
              padding: const EdgeInsets.only(left: 50.0,bottom: 5,top: 15),
              child: Row(
                children: [
                  Text(
                    "Feedback for:",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ),
            Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 1.4,
                child: GestureDetector(
                  onTap: (){
                    showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  feedbackcontroller.text = "Suggestion";
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text("Suggestion",style: TextStyle(color: Colors.blue)),
                                ),
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    feedbackcontroller.text = "Error";
                                    Navigator.pop(context);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text("Error",style: TextStyle(color: Colors.blue)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    );
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: feedbackcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.only(left: 5, right: 10)),
            SizedBox(height: 35),
            Container(
              color: Theme.of(context).accentColor,
              width: MediaQuery.of(context).size.width / 2,
              height: 30,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
