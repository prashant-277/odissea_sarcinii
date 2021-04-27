import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class nameDuedate extends StatefulWidget {
  @override
  _nameDuedateState createState() => _nameDuedateState();
}

class _nameDuedateState extends State<nameDuedate> {
  bool notpregnant = false;

  int _groupValue = -1;

  void _onRememberMeChanged(bool newValue) => setState(() {
        notpregnant = newValue;
        if (notpregnant) {
          print("pregnant");
        } else {
          print("notpregnant");
        }
      });

  List dueDate = ["Due Date", "LMP"];
  String select;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Name & Due Date"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Done"),
                  )))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "Assets/Images/profile_upload.png",
                      color: Colors.black38,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: kwhite,
                  ),
                ),
              ),
              Text(
                "Edit",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: 15),
              Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mother's Name",
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 14),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black26,
                            ),
                          ],
                        )),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    color: kwhite,
                  ),
                  padding: EdgeInsets.only(left: 5, right: 10)),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: notpregnant,
                      onChanged: _onRememberMeChanged,
                      checkColor: Theme.of(context).accentColor,
                      activeColor: kwhite,
                    ),
                    Text(
                      "Not Pregnant",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 17),
                    ),
                  ],
                ),
              ),
              notpregnant
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 7.5,
                            color: kwhite,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.zero,
                                  height: 28,
                                  child: RadioListTile(
                                    title: Text(
                                      "Due Date",
                                      style: TextStyle(
                                          color: _groupValue == 0
                                              ? kblack
                                              : Colors.black26),
                                    ),
                                    value: 0,
                                    groupValue: _groupValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _groupValue = newValue;
                                        print(_groupValue);
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  child: RadioListTile(
                                      title: Text(
                                        "LMP",
                                        style: TextStyle(
                                            color: _groupValue == 1
                                                ? kblack
                                                : Colors.black26),
                                      ),
                                      value: 1,
                                      groupValue: _groupValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _groupValue = newValue;
                                          print(_groupValue);
                                        });
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: 100,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (dateTime) {
                                debugPrint("$dateTime");
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 35,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(50.0)),
                                onPressed: () {},
                                child: Text(
                                  "Show Detail",
                                  style: TextStyle(color: kwhite),
                                ),
                                color: Colors.purple[300],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Theme.of(context).accentColor,
                              )),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
