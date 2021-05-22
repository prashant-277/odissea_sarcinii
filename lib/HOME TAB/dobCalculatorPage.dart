import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/duedate_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';

class dobCalculatorPage extends StatefulWidget {
  @override
  _dobCalculatorPageState createState() => _dobCalculatorPageState();
}

class _dobCalculatorPageState extends State<dobCalculatorPage> {
  List<RadioModel> sampleData = new List<RadioModel>();
  final url1 = url.basicUrl;

  String data;

  int count = 0;

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(
        true, 'Due date', '', Icon(Icons.arrow_back_ios_outlined)));
    sampleData.add(new RadioModel(
        false, 'LMP', '', Icon(Icons.arrow_forward_ios_outlined)));
  }

  static final now = DateTime.now();

  final dropdownDatePicker = DropdownDatePicker(
    dateFormat: DateFormat.dmy,
    firstDate: ValidDate(year: now.year - 1, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
    dropdownColor: kwhite,
    dateHint: DateHint(year: now.year.toString(), month: now.month.toString(), day: (now.day-1).toString()),
    ascending: false,
    underLine: Text(""),
  );

  final dropdownDatePickerduedate = DropdownDatePicker(
    dateFormat: DateFormat.dmy,
    firstDate: ValidDate(year: now.year, month: now.month, day: now.day),
    lastDate: ValidDate(year: now.year + 1, month: now.month, day: now.day),
    textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "OpenSans"),
    dropdownColor: kwhite,
    dateHint: DateHint(year: now.year.toString(), month: now.month.toString(), day: now.day.toString()),
    ascending: false,
    underLine: Text(""),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/background_new.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(""),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.asset("Assets/Icons/back.png", height: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "EDOB Calculator",
                            style: TextStyle(
                                color: kwhite,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "Assets/Images/img.png",
                      height: 135,
                      width: 135,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: kwhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Cosmina stratan",
                      style: TextStyle(
                          color: kwhite,
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(""),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((element) => element.isSelected = false);
                        sampleData[index].isSelected = true;
                      });
                      print("buttonText " + sampleData[index].buttonText);
                      if (sampleData[index].buttonText == "LMP") {
                        count = 1;
                      } else {
                        count = 0;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: new RadioItem(sampleData[index]),
                    ),
                  );
                },
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: Row(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        color: kblack,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 00),
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: count == 0
                          ? dropdownDatePickerduedate
                          : dropdownDatePicker),
                ],
              ),
            ),
            Visibility(
              visible: count == 0 ? false : true,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15),
                child: Row(
                  children: [
                    Text(
                      "Cycle Length",
                      style: TextStyle(
                          color: kblack,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: count == 0 ? false : true,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: new BoxDecoration(
                    color: kwhite,
                    border: new Border.all(width: 1.0, color: Colors.black12),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      "Select cycle",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        color: kblack),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 25,
                      color: kblack,
                    ),
                    underline: Text(""),
                    elevation: 0,
                    items: <String>[
                      '21 days',
                      '22 days',
                      '23 days',
                      '24 days',
                      '25 days',
                      '26 days',
                      '27 days',
                      '28 days',
                      '29 days',
                      '30 days',
                      '31 days',
                      '32 days',
                      '33 days',
                      '34 days',
                      '35 days'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                                color: kblack)),
                      );
                    }).toList(),
                    value: data,
                    onChanged: (newValue) {
                      setState(() {
                        data = newValue;
                        print("ddd " + data.toString().substring(0, 2));
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: primarybutton(
                    count == 0 ? "Calculate my due date" : "Calculate my LMP",
                    () {
                  count == 0 ? calculateDuedate() : calculateLMP();

                  // print(dropdownDatePicker.getDate());
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateDuedate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/calData";

    var map = new Map<String, dynamic>();
    map["due_date"] = dropdownDatePickerduedate.getDate().toString();

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("Calculator " + responseJson.toString());

    if (responseJson["status"].toString() == "Success") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => duedate_Page(responseJson["data"])));
    }
  }

  calculateLMP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/calData";

    var map = new Map<String, dynamic>();
    map["due_date"] = dropdownDatePicker.getDate().toString();
    map["cycle_length"] = data.toString().substring(0, 2);

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response =
        await http.post(Uri.parse(url), headers: header, body: map);

    final responseJson = json.decode(response.body);
    print("Calculator " + responseJson.toString());

    if (responseJson["status"].toString() == "Success") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => duedate_Page(responseJson["data"])));
    }
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width / 3.0,
          child: new Center(
            child: new Text(_item.buttonText,
                style: new TextStyle(
                    color: _item.isSelected ? kwhite : kblack,
                    fontFamily: "OpenSans",
                    fontSize: 15.0)),
          ),
          decoration: new BoxDecoration(
            color: _item.isSelected ? buttonColor : kwhite,
            border: new Border.all(
                width: 0.0,
                color: _item.isSelected ? buttonColor : Colors.grey),
            borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
          ),
        ),
        Positioned(
            top: 25,
            child: Image.asset("Assets/Icons/select.png",
                height: _item.isSelected ? 25 : 0)),
      ],
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  final Widget icon;

  RadioModel(this.isSelected, this.buttonText, this.text, this.icon);
}
