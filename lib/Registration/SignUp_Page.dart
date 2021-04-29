import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  List<RadioModel> sampleData = new List<RadioModel>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController fname_controller = TextEditingController();
  TextEditingController lname_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
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
      backgroundColor: kwhite,
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
              Row(
                children: [
                  IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "Assets/Icons/back.png",
                      height: 15,
                      color: kwhite,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: kwhite,
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
                  height: MediaQuery.of(context).size.height / 1.45,
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: kwhite,
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 15),
                              child: Container(
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
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          textfield(
                                            controller: fname_controller,
                                            obscureText: false,
                                            hintText: "First Name",
                                            functionValidate: commonValidation,
                                            suffixIcon: null,
                                            prefixIcon: null,
                                            parametersValidate:
                                                "Please enter First Name",
                                            textInputType: TextInputType.name,
                                          ),
                                          SizedBox(height: 10),
                                          textfield(
                                            controller: lname_controller,
                                            obscureText: false,
                                            hintText: "Last Name",
                                            functionValidate: commonValidation,
                                            suffixIcon: null,
                                            prefixIcon: null,
                                            parametersValidate:
                                                "Please enter Last Name",
                                            textInputType: TextInputType.name,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: textfield(
                                controller: username_controller,
                                obscureText: false,
                                hintText: "User Name",
                                functionValidate: commonValidation,
                                suffixIcon: null,
                                prefixIcon: new IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/user.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: buttonColor,
                                  ),
                                  onPressed: null,
                                ),
                                parametersValidate: "Please enter User Name",
                                textInputType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: textfield(
                                controller: email_controller,
                                obscureText: false,
                                hintText: "Email",
                                functionValidate: commonValidation,
                                suffixIcon: null,
                                prefixIcon: new IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/email.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: buttonColor,
                                  ),
                                  onPressed: null,
                                ),
                                parametersValidate: "Please enter Email",
                                textInputType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: textfield(
                                controller: password_controller,
                                obscureText: show,
                                hintText: "Password",
                                functionValidate: commonValidation,
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
                                prefixIcon: IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/password.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: buttonColor,
                                  ),
                                  onPressed: null,
                                ),
                                parametersValidate: "Please enter Password",
                                textInputType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: GestureDetector(
                                onTap: () async {
                                  DateTime date =
                                      await DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime(1980, 3, 5),
                                    maxTime: DateTime.now(),
                                    onChanged: (date) {},
                                    onConfirm: (date) {},
                                    locale: LocaleType.en,
                                    theme: DatePickerTheme(
                                      backgroundColor: kwhite,
                                      headerColor: statusbarColor,
                                      containerHeight: 150,
                                      itemStyle: TextStyle(
                                          fontFamily: "OpenSans", fontSize: 15),
                                      doneStyle: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: kwhite),
                                      cancelStyle: TextStyle(
                                          fontFamily: "OpenSans",
                                          color: kwhite),
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
                                  child: textfield(
                                    controller: dob_controller,
                                    obscureText: false,
                                    hintText: "EDOB",
                                    functionValidate: commonValidation,
                                    suffixIcon: new IconButton(
                                      icon: new Image.asset(
                                        'Assets/Icons/calender.png',
                                        width: 20.0,
                                        height: 20.0,
                                      ),
                                      onPressed: null,
                                    ),
                                    prefixIcon: new IconButton(
                                      icon: new Image.asset(
                                        'Assets/Icons/birthday.png',
                                        width: 20.0,
                                        height: 20.0,
                                        color: buttonColor,
                                      ),
                                      onPressed: null,
                                    ),
                                    parametersValidate: "Please select EDOB",
                                    textInputType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: primarybutton("Sign Up", () {
                                  if (_formKey.currentState.validate()) {
                                    print("done");
                                  }
                                })),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
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
                      border: Border.all(color: kblack26),
                      color: kwhite,
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
                          color: kwhite,
                          fontSize: 18,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(milliseconds: 300),
                                child: SignIn_Page()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: kwhite,
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
                      color: _item.isSelected ? kwhite : kblack,
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
