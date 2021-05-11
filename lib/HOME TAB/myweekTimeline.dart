import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/uploadDialog.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/uploadphotosdialog.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myweekTimeline extends StatefulWidget {
  @override
  _myweekTimelineState createState() => _myweekTimelineState();
}

class _myweekTimelineState extends State<myweekTimeline>
    with TickerProviderStateMixin {
  final url1 = url.basicUrl;
  bool isLoading = true;

  List imagedata = [];
  int post_week;

  File _image1;
  String urlimg1;
  String document_path1;

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

    final response = await http.post(url, headers: header);

    final responseJson = json.decode(response.body);

    setState(() {
      imagedata = responseJson["data"];
      post_week = imagedata.length + 1;
      isLoading = false;
    });
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
          child: isLoading
              ? SpinKitFadingFour(
                  color: kwhite,
                  controller: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 1200)),
                )
              : Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(""),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Image.asset("Assets/Icons/back.png", height: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.32,
                          child: ListView.builder(
                            itemCount:
                                imagedata == null ? "" : imagedata.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Week",
                                        style: TextStyle(
                                            color: kwhite,
                                            fontFamily: "OpenSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        imagedata[index]["week"].toString(),
                                        style: TextStyle(
                                            color: kwhite,
                                            fontFamily: "OpenSans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        width: 0.2,
                                        color: kwhite,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    child: GestureDetector(
                                      child: Hero(
                                        tag: 'imageHero',
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2.45,
                                          child: ClipRRect(
                                              // borderRadius: new BorderRadius.circular(12.0),
                                              child: FadeInImage(
                                                  image: NetworkImage(imagedata[
                                                                          index]
                                                                      ["image_arr"]
                                                                  [0]["image"]
                                                              .toString() ==
                                                          ""
                                                      ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                      : "https://chessmafia.com/php/Odiseea/public/uploads/" +
                                                          imagedata[index]
                                                                      ["image_arr"]
                                                                  [0]["image"]
                                                              .toString()),
                                                  fit: BoxFit.fill,
                                                  placeholder: AssetImage(
                                                      "Assets/Images/giphy.gif"))),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 7)),
                                        ),

                                        /*Image.network("https://chessmafia.com/php/Odiseea/public/uploads/"+imagedata[index]["image_arr"][0]["image"].toString(),
                                    height: 170,
                                  ),*/
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return DetailScreen(imagedata, index);
                                        }));
                                      },
                                    ),
                                  ),
                                  Image.asset(
                                    "Assets/Images/group1589.png",
                                    height: 10,
                                    color: Colors.transparent,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                    contentPadding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 15),
                    backgroundColor: kwhite,
                    content: uploadDialog())).then((_) => setState(() {
                  getImages();
                }));
          });
        },
        child: Image.asset("Assets/Icons/add.png"),
      ),
    );
  }

  /*Widget uploadDialog() {
    return Container(
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
                                height: MediaQuery.of(context).size.height / 1,
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
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var postUri = Uri.parse("$url1/imageUpload");
                  var request = new http.MultipartRequest("POST", postUri);
                  request.fields['week'] = post_week.toString()=="null"?"1":post_week.toString();

                  request.headers["Authorization"] =
                      prefs.getString("apiToken").toString();

                  document_path1 != null
                      ? request.files.add(
                          await MultipartFile.fromPath('image', document_path1))
                      : request.fields["image"] = "";

                  request.send().then((response) async {
                    if (response.statusCode == 200) {
                      print("Uploaded!");

                      print("--------> " + response.statusCode.toString());

                      final responseStream =
                          await response.stream.bytesToString();
                      final responseJson = json.decode(responseStream);

                      print(responseJson.toString());
                      if (responseJson["status"].toString() == "Success") {
                        displayToast(responseJson["message"].toString());
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
                })),
          )
        ],
      ),
    );
  }*/

  /*Widget selectPhoto() {
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
  }*/

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

class DetailScreen extends StatefulWidget {
  List imagedata;

  int index;

  DetailScreen(this.imagedata, this.index);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  List imageArray = [];
  final url1 = url.basicUrl;
  bool isLoading = true;

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

    final response = await http.post(url, headers: header);

    final responseJson = json.decode(response.body);

    setState(() {
      imageArray = responseJson["data"][widget.index]["image_arr"];
      print("dddd" + imageArray.toString());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appbartext: "Week " + widget.imagedata[widget.index]["week"],
        appBar: AppBar(),
        widgets: [
          IconButton(
              onPressed: () async {
                await FlutterShare.share(
                    title: 'Odiseea Sarcinii',
                    text: '',
                    linkUrl: "https://chessmafia.com/php/Odiseea/public/uploads/" + imageArray[0]["image"].toString(),
                    chooserTitle: '');

              },
              icon: Image.asset(
                "Assets/Icons/share.png",
                height: 15,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: isLoading
            ? SpinKitFadingFour(
                color: kwhite,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              )
            : PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageArray == null ? "" : imageArray.length,
                itemBuilder: (context, index) {
                  return Hero(
                      tag: 'imageHero',
                      child: FadeInImage(
                          image: NetworkImage(
                            imageArray[index]["image"].toString() == ""
                                ? ""
                                    "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                : "https://chessmafia.com/php/Odiseea/public/uploads/" +
                                    imageArray[index]["image"].toString(),
                          ),
                          placeholder: AssetImage("Assets/Images/giphy.gif"))

                      /*Image.network(
                  "https://chessmafia.com/php/Odiseea/public/uploads/" + imageArray[index]["image"].toString(),
                  fit: BoxFit.fill,
                ),*/
                    );
                }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          backgroundColor: kwhite,
                          content: uploadphotosdialog(widget.imagedata[widget.index]["week"])))
                  .then((_) => setState(() {
                        getImages();
                      }));
            },
            child: Image.asset("Assets/Icons/add.png"),
          ),
          FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: Image.asset("Assets/Icons/delete.png"),
            onPressed: () {
              print(widget.imagedata[widget.index]["week"]);
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: kwhite,
                        title: Text(
                          "Are you sure",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                              color: kblack,
                              fontSize: 20),
                        ),
                        content: Text(
                          "You want to Delete this photo?",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600,
                              color: kblack,
                              fontSize: 15),
                        ),
                        actions: [
                          FlatButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: kblack,
                                  fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                  fontSize: 15),
                            ),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              var url = "$url1/deleteImage/" +
                                  imageArray[0]["id"].toString();

                              Map<String, String> header = {
                                "Authorization":
                                    prefs.getString("apiToken").toString()
                              };

                              final response =
                                  await http.get(url, headers: header);

                              final responseJson = json.decode(response.body);
                              if (responseJson["status"] == "Success") {
                                displayToast(
                                    responseJson["message"].toString());
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                              } else {
                                displayToast(
                                    responseJson["message"].toString());
                              }
                            },
                          ),
                        ],
                      )).then((_) => setState(() {
                    getImages();
                  }));
            },
          ),
        ],
      ),
    );
  }
}
