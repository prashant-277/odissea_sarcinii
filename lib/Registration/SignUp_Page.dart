import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  List<RadioModel> sampleData = new List<RadioModel>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController dob_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(
        false, 'M', 'Male', Icon(Icons.arrow_back_ios_outlined)));
    sampleData.add(new RadioModel(
        false, 'F', 'Female', Icon(Icons.arrow_forward_ios_outlined)));
  }

  String password = '';
  bool show = true;

  void onTap() {
    show = !show;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/background2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/Icons/back.png",
                        fit: BoxFit.fill,
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 0, right: 0, top: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 6.0,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: new Image.asset(
                                    'Assets/Images/profile_pic.png',
                                  ),
                                  iconSize: 90,
                                  onPressed: null,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.7,
                                      child: TextField(
                                        maxLines: 1,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 20.0, 10.0),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  color: kGray, width: 1)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  color: kGray, width: 1)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: kGray,
                                              width: 1.0,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "OpenSans",
                                          ),
                                          hintText: 'First name',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.7,
                                      child: TextField(
                                        maxLines: 1,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15.0, 10.0, 20.0, 10.0),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  color: kGray, width: 1)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  color: kGray, width: 1)),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: kGray,
                                              width: 1.0,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: "OpenSans",
                                          ),
                                          hintText: 'Last name',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontFamily: "OpenSans", color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: kGray,
                                  width: 1.0,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "OpenSans",
                              ),
                              hintText: 'User name',
                              prefixIcon: new IconButton(
                                icon: new Image.asset(
                                  'Assets/Icons/user.png',
                                  width: 20.0,
                                  height: 20.0,
                                  color: buttonColor,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontFamily: "OpenSans", color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: kGray,
                                  width: 1.0,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "OpenSans",
                              ),
                              hintText: 'Email',
                              prefixIcon: new IconButton(
                                icon: new Image.asset(
                                  'Assets/Icons/email.png',
                                  width: 20.0,
                                  height: 20.0,
                                  color: buttonColor,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontFamily: "OpenSans", color: Colors.black),
                            obscureText: show,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Colors.grey,
                                icon: !show
                                    ? Image.asset(
                                        'Assets/Icons/visible.png',
                                        width: 25.0,
                                        height: 25.0,
                                      )
                                    : Image.asset(
                                        'Assets/Icons/invisible.png',
                                        width: 25.0,
                                        height: 25.0,
                                      ),
                                onPressed: () {
                                  onTap();
                                },
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide:
                                      BorderSide(color: kGray, width: 1)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: kGray,
                                  width: 1.0,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontFamily: "OpenSans",
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              prefixIcon: new IconButton(
                                icon: new Image.asset(
                                  'Assets/Icons/password.png',
                                  width: 20.0,
                                  height: 20.0,
                                  color: buttonColor,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: GestureDetector(
                            onTap: () async {
                              DateTime date = await DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime(1980, 3, 5),
                                maxTime: DateTime.now(),
                                onChanged: (date) {},
                                onConfirm: (date) {},
                                locale: LocaleType.en,
                                theme: DatePickerTheme(
                                  backgroundColor: Colors.white,
                                  headerColor: statusbarColor,
                                  containerHeight: 150,
                                  itemStyle: TextStyle(
                                      fontFamily: "OpenSans", fontSize: 15),
                                  doneStyle: TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.white),
                                  cancelStyle: TextStyle(
                                      fontFamily: "OpenSans",
                                      color: Colors.white),
                                ),
                              );

                              setState(() {
                                date = date;
                                dob_controller.text = date.day.toString() +
                                    "-" +
                                    date.month.toString() +
                                    "-" +
                                    date.year.toString();
                              });
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                controller: dob_controller,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      15.0, 10.0, 20.0, 10.0),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: kGray, width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide:
                                          BorderSide(color: kGray, width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: kGray,
                                      width: 1.0,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "OpenSans",
                                  ),
                                  hintText: 'Birth Date',
                                  prefixIcon: new IconButton(
                                    icon: new Image.asset(
                                      'Assets/Icons/birthday.png',
                                      width: 20.0,
                                      height: 20.0,
                                      color: buttonColor,
                                    ),
                                    onPressed: null,
                                  ),
                                  suffixIcon: new IconButton(
                                    icon: new Image.asset(
                                      'Assets/Icons/calender.png',
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: primarybutton("Sign Up", () {})),
                      ],
                    ),
                  ),
                ),
              ),
              /*Padding(
                  padding: const EdgeInsets.only(top: 7.0, bottom: 0),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return new InkWell(
                          splashColor: Theme.of(context).primaryColor,
                          onTap: () {
                            setState(() {
                              sampleData.forEach(
                                  (element) => element.isSelected = false);
                              sampleData[index].isSelected = true;
                            });
                            print(sampleData[index].text);
                            print(sampleData[index].buttonText);
                          },
                          child: new RadioItem(sampleData[index]),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white38,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),*/
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                    child: Column(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn_Page()));
                      },
                      child: Text(
                        "Sing In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
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
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 45.0,
            width: 45.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.purple[300] : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.purple[300] : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
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
  final String text;
  final Widget icon;

  RadioModel(this.isSelected, this.buttonText, this.text, this.icon);
}
