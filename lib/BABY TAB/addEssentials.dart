import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';

class addEssentials extends StatefulWidget {
  @override
  _addEssentialsState createState() => _addEssentialsState();
}

class _addEssentialsState extends State<addEssentials> {
  String data;
  bool isLoading = true;
  final url1 = url.basicUrl;
  List essentialPlanList = [];
  TextEditingController descripation_cntrl = TextEditingController();

  int count;
  @override
  void initState() {
    super.initState();
    getessential();
  }

  Future<void> getessential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/getessentialList";

    var map = new Map<String, dynamic>();
    map["type"] = "";
    map["essential_id"] =  "";
    map["flag"] = "";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header,body:map);

    final responseJson = json.decode(response.body);
    print("essential plan " + responseJson.toString());

    setState(() {
      isLoading = false;
      essentialPlanList = responseJson["data"];
    });
  }

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
                      'BATHTIME',
                      'BLANKETS',
                      'CLOTHING',
                      'FEEDING',
                      'IF YOU ARE FORMULA FEEDING',
                      "NICE-TO-HAVE ITEMS",
                      'OTHER NECESSITIES',
                      'SOME NURSING MOTHERS LIKE TO HAVE THESE ITEMS',
                      'BEDTIME: IF YOU ARE CO-SLEEPING',
                      'BEDTIME: IF YOU ARE USING A CRIB',
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
              padding: const EdgeInsets.only(top: 10.0, right: 10)  ,
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: descripation_cntrl,
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
                  child: primarybutton("Save", () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    var url = "$url1/createessentialList";

                    for (int i = 0; i < essentialPlanList.length; i++) {
                      if (essentialPlanList[i]["title"].toString() !=
                          data.toString()) {
                        if (count == null) {
                          setState(() {
                            count = 0;
                          });
                        }
                      } else {
                        setState(() {
                          count = 1;
                        });
                      }
                    }
                    var map = new Map<String, dynamic>();
                    map["title"] = data.toString();
                    map["description"] = descripation_cntrl.text.toString();
                    map["flag"] = count.toString();

                    Map<String, String> header = {
                      "Authorization": prefs.getString("apiToken").toString()
                    };

                    final response = await http.post(Uri.parse(url),
                        headers: header, body: map);

                    final responseJson = json.decode(response.body);
                    print("birth plan add " + responseJson.toString());
                    if (responseJson["status"] == "Success") {
                      Navigator.pop(context);
                    }else{
                      displayToast(responseJson["message"].toString());
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}
