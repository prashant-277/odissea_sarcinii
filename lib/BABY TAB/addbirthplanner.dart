import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class addbirthplanner extends StatefulWidget {
  @override
  _addbirthplannerState createState() => _addbirthplannerState();
}

class _addbirthplannerState extends State<addbirthplanner> {
  String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Item",
                  style: TextStyle(
                      color: Colors.black,
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
            Row(
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.45,
                  decoration: new BoxDecoration(
                    color: kGray,
                    border: new Border.all(width: 1.0, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    menuMaxHeight: 300,
                    isExpanded: true,
                    hint: Text(
                      "Tap to select category",
                      style: TextStyle(
                          fontFamily: "OpenSans", fontWeight: FontWeight.w600),
                    ),
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: Colors.black,
                    ),
                    underline: Text(""),
                    elevation: 0,
                    items: <String>[
                      'PEOPLE',
                      'ACOMODARE SPITAL/MATERNITATE ',
                      'DOCUMENTS',
                      'IF I HAVE A BOY',
                      'PHOTO VIDEO',
                      "BABY FEEDING",
                      'PAIN RELIEF',
                      'LABOUR PROCEDURE',
                      'Physical and psychological preparation'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    value: data,
                    onChanged: (newValue) {
                      setState(() {
                        data = newValue;
                        print(data);
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 0),
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontFamily: "OpenSans", color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: "OpenSans",
                          fontSize: 14),
                      hintText: 'Type your description here...',
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: kGray),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  padding: EdgeInsets.only(left: 5, right: 10)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: primarybutton("Save", () {
                    Navigator.pop(context);
                  })),
            )
          ],
        ),
      ),
    );
  }
}
