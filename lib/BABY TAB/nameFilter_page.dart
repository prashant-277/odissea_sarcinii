import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class nameFilter_page extends StatefulWidget {
  @override
  _nameFilter_pageState createState() => _nameFilter_pageState();
}

class _nameFilter_pageState extends State<nameFilter_page> {
  List<RadioModel> sampleData = new List<RadioModel>();
  String data;

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(true, 'Assets/Icons/boy.png', '',
        Icon(Icons.arrow_back_ios_outlined), "Assets/Icons/boy_act.png"));
    sampleData.add(new RadioModel(false, 'Assets/Icons/girl.png', '',
        Icon(Icons.arrow_forward_ios_outlined), "Assets/Icons/girl_act.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appBar: AppBar(),
        appbartext: "Filter",
      ),
      body: Container(
        color: kwhite,
        child: Column(
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
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
                      print(sampleData[index].text);
                      print(sampleData[index].buttonText);
                    },
                    child: new RadioItem(sampleData[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Show only one alphabet",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: kblack,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 45,
                decoration: new BoxDecoration(
                  color: kGray,
                  border: new Border.all(width: 1.0, color: Colors.black12),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10.0)),
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    "Select alphabet",
                    style: TextStyle(
                        fontFamily: "OpenSans", fontWeight: FontWeight.w600),
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
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
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
                      print(data);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: primarybutton("Find name", () {})),
            )
          ],
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(20.0),
      child: new Row(
        children: <Widget>[
          Stack(
            children: [
              Container(
                //height: 45.0,
                width: MediaQuery.of(context).size.width / 4.2,
                child: new Image.asset(
                    _item.isSelected ? _item.buttonText1 : _item.buttonText),
                decoration: new BoxDecoration(
                  color: _item.isSelected
                      ? Colors.transparent
                      : Colors.transparent,
                  border: new Border.all(
                      width: 0.0,
                      color: _item.isSelected
                          ? Colors.transparent
                          : Colors.transparent),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(50.0)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(""),
                    Image.asset("Assets/Icons/select.png",
                        height: _item.isSelected ? 25 : 0),
                  ],
                ),
              )
            ],
          ),
          new Container(
            margin: new EdgeInsets.only(left: 0.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String buttonText1;
  final String text;
  final Widget icon;

  RadioModel(
      this.isSelected, this.buttonText, this.text, this.icon, this.buttonText1);
}
