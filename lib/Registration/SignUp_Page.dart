import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odiseea_sarcinii/Registration/SignIn_Page.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  final url1 = url.basicUrl;

  final _formKey = GlobalKey<FormState>();
  File _image1;
  String urlimg1;
  String document_path1;
  PermissionStatus _status;

  TextEditingController fname_controller = TextEditingController();
  TextEditingController lname_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController dob_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera)
        .then(_updateStatus);
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
                                      icon: _image1 == null
                                          ? Image.asset(
                                              "Assets/Images/profile_pic.png")
                                          : Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              child: ClipRRect(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        50.0),
                                                child: _image1 == null
                                                    ? Image.network(
                                                        urlimg1 == null
                                                            ? ""
                                                            : urlimg1,
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Image.file(_image1,
                                                        height:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            6,
                                                        fit: BoxFit.fill),
                                              ),
                                            ),
                                      iconSize: 90,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                new AlertDialog(
                                                  title: Text("Upload photo"),
                                                  elevation: 1,
                                                  contentPadding:
                                                      EdgeInsets.all(5.0),
                                                  content:
                                                      new SingleChildScrollView(
                                                    child: new ListBody(
                                                      children: <Widget>[
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: FlatButton(
                                                            onPressed:
                                                                _askPermissionD1,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text("Camera"),
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                BorderDirectional(
                                                              bottom: BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .black12),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: FlatButton(
                                                            onPressed:
                                                                imageSelectorGalleryD1,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text("Gallery"),
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                BorderDirectional(
                                                              bottom: BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .black12),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: FlatButton(
                                                            onPressed: () {},
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text("View"),
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                BorderDirectional(
                                                              bottom: BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .black12),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              document_path1 =
                                                                  null;
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text("Delete"),
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                BorderDirectional(
                                                              bottom: BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .black12),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Text("Cancel"),
                                                              ],
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border:
                                                                BorderDirectional(
                                                              bottom: BorderSide(
                                                                  width: 0.5,
                                                                  color: Colors
                                                                      .black12),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
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
                                    minTime: DateTime.now(),
                                    maxTime:
                                        DateTime.now().add(Duration(days: 280)),
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
                                    dob_controller.text = date.year.toString() +
                                        "-" +
                                        date.day.toString() +
                                        "-" +
                                        date.month.toString();
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
                                    registrationData();
                                  } else {
                                    displayToast("Enter valid data");
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

  void _askPermissionD1() {
    PermissionHandler().requestPermissions([PermissionGroup.camera]).then(
        _onStatusRequestedD1);
  }

  void _onStatusRequestedD1(Map<PermissionGroup, PermissionStatus> value) {
    final status = value[PermissionGroup.camera];
    if (status == PermissionStatus.granted) {
      imageSelectorCameraD1();
    } else {
      _updateStatus(status);
    }
  }

  _updateStatus(PermissionStatus value) {
    if (value != _status) {
      setState(() {
        _status = value;
      });
    }
  }

  void imageSelectorCameraD1() async {
    Navigator.pop(context);
    var imageFile1 = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      print(document_path1);
    });
    document_path1 = imageFile1.path;
    if (document_path1.indexOf('file://') == 0) {
      document_path1 = document_path1.split('file://')[1];
      print(document_path1);
    }
    setState(() {
      _image1 = imageFile1;
      print(document_path1);
    });
  }

  void imageSelectorGalleryD1() async {
    Navigator.pop(context);
    var imageFile1 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      print(document_path1);
    });
    document_path1 = imageFile1.path;
    if (document_path1.indexOf('file://') == 0) {
      document_path1 = document_path1.split('file://')[1];
      print(document_path1);
      //document_path1 = File(file) as String;
    }
    setState(() {
      _image1 = imageFile1;
    });
  }

  Future<void> registrationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var postUri = Uri.parse("$url1/register");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user_name'] = username_controller.text.toString();
    request.fields['first_name'] = fname_controller.text.toString();
    request.fields['last_name'] = lname_controller.text.toString();
    request.fields['email'] = email_controller.text.toString();
    request.fields['password'] = password_controller.text.toString();
    request.fields['device_id'] = prefs.getString("deviceId").toString();
    request.fields['fcm_token'] = prefs.getString("fcmToken").toString();
    request.fields['dob'] = dob_controller.text.toString();

    document_path1 != null
        ? request.files
            .add(await MultipartFile.fromPath('image', document_path1))
        : request.fields["image"] = "";

    request.send().then((response) async {
      if (response.statusCode == 200) {
        print("Uploaded!");

        print("--------> " + response.statusCode.toString());

        final responseStream = await response.stream.bytesToString();
        final responseJson = json.decode(responseStream);

        print(responseJson.toString());
        if (responseJson["status"].toString() == "Success") {
          displayToast(responseJson["message"].toString());

          Timer(
              Duration(seconds: 1),
              () => Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      alignment: Alignment.bottomCenter,
                      duration: Duration(milliseconds: 300),
                      child: SignIn_Page())));
        } else {
          displayToast(responseJson["message"].toString());
        }
      } else {
        final responseStream = await response.stream.bytesToString();
        final responseJson = json.decode(responseStream);

        print("Not Uploaded");
      }
    });
  }
}
