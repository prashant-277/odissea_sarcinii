import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/myweekTimeline.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odiseea_sarcinii/url.dart';

class uploadDialog extends StatefulWidget {
  @override
  _uploadDialogState createState() => _uploadDialogState();
}

class _uploadDialogState extends State<uploadDialog> {
  final url1 = url.basicUrl;
  TextEditingController weeknumberctrl = TextEditingController();

  List imagedata = [];
  int post_week;
  final _formKey = GlobalKey<FormState>();

  String urlimg1;
  String document_path1;

  File _image1;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = "$url1/getImage";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);

    setState(() {
      imagedata = responseJson["data"];
      post_week = imagedata.length + 1;
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
                  "Add new image",
                  style: TextStyle(
                      color: kblack,
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
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Form(
                key: _formKey,
                child: textfield(
                  controller: weeknumberctrl,
                  obscureText: false,
                  hintText: "Enter week number",
                  functionValidate: commonValidation,
                  suffixIcon: null,
                  prefixIcon: null,
                  parametersValidate: "Please enter week number",
                  textInputType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black26, width: 0.5)),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                          title: Text("Upload photo"),
                          elevation: 1,
                          contentPadding: EdgeInsets.all(5.0),
                          content: selectPhoto()));
                },
                icon: _image1 == null
                    ? Image.asset(
                        "Assets/Images/new_img.png",
                        height: 75,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width / 1,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: _image1 == null
                              ? Image.network(
                                  urlimg1 == null ? "" : urlimg1,
                                  fit: BoxFit.fill,
                                )
                              : Image.file(_image1,
                                  height:
                                      MediaQuery.of(context).size.height / 1,
                                  width: MediaQuery.of(context).size.width / 6,
                                  fit: BoxFit.fill),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: primarybutton("Upload", () async {
                    if (_formKey.currentState.validate()) {
                      if (document_path1 == null) {
                        displayToast("Please select an image");
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var postUri = Uri.parse("$url1/imageUpload");
                        var request =
                            new http.MultipartRequest("POST", postUri);
                        request.fields['week'] = weeknumberctrl.text.toString();

                        request.headers["Authorization"] =
                            prefs.getString("apiToken").toString();

                        document_path1 != null
                            ? request.files.add(await MultipartFile.fromPath(
                                'image', document_path1))
                            : request.fields["image"] = "";

                        request.send().then((response) async {
                          if (response.statusCode == 200) {
                            print("Uploaded!");

                            print(
                                "--------> " + response.statusCode.toString());

                            final responseStream =
                                await response.stream.bytesToString();
                            final responseJson = json.decode(responseStream);

                            print(responseJson.toString());
                            if (responseJson["status"].toString() ==
                                "Success") {
                              displayToast(responseJson["message"].toString());
                              Navigator.pop(context);
                            } else {
                              displayToast(responseJson["message"].toString());
                            }
                          } else {
                            final responseStream =
                                await response.stream.bytesToString();
                            final responseJson = json.decode(responseStream);

                            print("Not Uploaded");
                            print(responseJson);
                          }
                        });
                      }
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }

  Widget selectPhoto() {
    return SingleChildScrollView(
      child: new ListBody(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              onPressed: () {
                imageSelectorCameraD1();
              },
              child: Row(
                children: <Widget>[
                  Text("Camera"),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 0.5, color: Colors.black12),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              onPressed: () {
                imageSelectorGalleryD1();
              },
              child: Row(
                children: <Widget>[
                  Text("Gallery"),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(width: 0.5, color: Colors.black12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void imageSelectorCameraD1() async {
    Navigator.pop(context);
    var imageFile1 = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

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

    document_path1 = imageFile1.path;
    if (document_path1.indexOf('file://') == 0) {
      document_path1 = document_path1.split('file://')[1];
      print(document_path1);
      //document_path1 = File(file) as String;
    }
    setState(() {
      _image1 = imageFile1;
      print(document_path1);
    });
  }
}
