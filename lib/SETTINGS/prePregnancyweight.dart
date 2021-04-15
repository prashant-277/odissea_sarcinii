import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class prePregnancyweight extends StatefulWidget {
  @override
  _prePregnancyweightState createState() => _prePregnancyweightState();
}

class _prePregnancyweightState extends State<prePregnancyweight> {
  var _currentValueweight = 35;
  var _currentValueweightpoint = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pre-Pregnancy Weight"),
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
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Weight is : $_currentValueweight.$_currentValueweightpoint KG",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: _currentValueweight,
                  minValue: 30,
                  maxValue: 153,
                  step: 1,
                  haptics: true,
                  itemHeight: 30,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  onChanged: (value) =>
                      setState(() => _currentValueweight = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ".",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                NumberPicker(
                  value: _currentValueweightpoint,
                  minValue: 0,
                  maxValue: 9,
                  step: 1,
                  haptics: true,
                  itemHeight: 30,
                  selectedTextStyle: TextStyle(fontSize: 17),
                  textStyle: TextStyle(fontSize: 17, color: Colors.black26),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  onChanged: (value) =>
                      setState(() => _currentValueweightpoint = value),
                ),
              ],
            ),
            SizedBox(height: 35),
            Container(
              color: Theme.of(context).accentColor,
              width: MediaQuery.of(context).size.width / 2,
              height: 35,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Save",
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
