import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';

class editProfile extends StatefulWidget {
  var userData;

  editProfile(this.userData);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final url1 = url.basicUrl;
  final url2 = url.imageUrl;

  TextEditingController dob_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  File _image1;
  String urlimg1;
  String document_path1;

  @override
  void initState() {
    super.initState();
    dob_controller.text = widget.userData["dob"].toString();
    username_controller.text = widget.userData["user_name"].toString();
    email_controller.text = widget.userData["email"].toString();
    urlimg1 = url2 + widget.userData["image"].toString();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("",style: TextStyle(fontSize: 1),),
              IconButton(onPressed: (){Navigator.pop(context);}, icon: Image.asset(
                "Assets/Icons/back.png",
                fit: BoxFit.fill,
                height: 15,
              ),),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Edit Profile",
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
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: kwhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: (){
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
                                            width: MediaQuery.of(context).size.width,
                                            child: FlatButton(
                                              onPressed: imageSelectorCameraD1,
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Camera"),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              border: BorderDirectional(
                                                bottom: BorderSide(width: 0.5,color: Colors .black12),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: FlatButton(
                                              onPressed: imageSelectorGalleryD1,
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Gallery"),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              border: BorderDirectional(
                                                bottom: BorderSide( width: 0.5, color: Colors .black12),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: FlatButton(
                                              onPressed: () {Navigator.pop(context);},
                                              child: Row(
                                                children: <Widget>[
                                                  Text("Cancel"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )).then((value) => null);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: new BorderRadius.circular(100.0),
                                        child: _image1 == null
                                            ? Image.network( urlimg1 == null ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg" : urlimg1,
                                          height: MediaQuery.of(context).size.height /1,
                                          width: MediaQuery.of(context).size.width / 3.30,
                                          fit: BoxFit.fill,
                                        )
                                            : Image.file(_image1,
                                            height: MediaQuery.of(context).size.height /1,
                                            width: MediaQuery.of(context).size.width / 3.30,
                                            fit: BoxFit.fill),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "Assets/Icons/add_pic.png",
                                      height: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: textfield(
                            controller: username_controller,
                            obscureText: false,
                            textInputType: TextInputType.text,
                            prefixIcon: new IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/user.png',
                                width: 20.0,
                                height: 20.0,
                                color: kblack,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: textfield(
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                            controller: email_controller,

                            prefixIcon: IconButton(
                              icon: new Image.asset(
                                'Assets/Icons/email.png',
                                width: 20.0,
                                height: 20.0,
                                color: kblack,
                              ),
                              onPressed: null,
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
                                textInputType: TextInputType.number,
                                prefixIcon: new IconButton(
                                  icon: new Image.asset(
                                    'Assets/Icons/birthday.png',
                                    width: 20.0,
                                    height: 20.0,
                                    color: kblack,
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
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: primarybutton("Save", () async {

                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var postUri = Uri.parse("$url1/updateProfile");
                              var request = new http.MultipartRequest("POST", postUri);

                              request.fields['user_name'] = username_controller.text.toString();
                              request.fields['dob'] = dob_controller.text.toString();
                              request.headers["Authorization"] = prefs.getString("apiToken").toString();

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

                                  } else {
                                    displayToast(responseJson["message"].toString());
                                  }
                                } else {
                                  final responseStream = await response.stream.bytesToString();
                                  final responseJson = json.decode(responseStream);

                                  print("Not Uploaded");
                                }
                              });

                            })),

                      ],
                    ),
                  ),
                ),
              ),
              Text(""),

            ],
          ),
        ),
      ),
    );
  }

  void imageSelectorCameraD1() async {
    Navigator.of(context, rootNavigator: true).pop('dialog');

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
    Navigator.of(context, rootNavigator: true).pop('dialog');

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
}
