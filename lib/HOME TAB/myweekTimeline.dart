import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Page.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/uploadDialog.dart';
import 'package:odiseea_sarcinii/HOME%20TAB/uploadphotosdialog.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/WIDGETS/toastDisplay.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:http/http.dart' as http;
import 'package:odiseea_sarcinii/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class myweekTimeline extends StatefulWidget {
  @override
  _myweekTimelineState createState() => _myweekTimelineState();
}

class _myweekTimelineState extends State<myweekTimeline>
    with TickerProviderStateMixin {
  final url1 = url.basicUrl;
  final url2 = url.imageUrl;

  bool isLoading = true;

  List imagedata = [];
  int post_week;

  File _image1;
  String urlimg1;
  String document_path1;

  String status;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("apiToken").toString());
    var url = "$url1/getImage";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.post(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);

    setState(() {
      imagedata = responseJson["data"];
      post_week = imagedata.length + 1;
      status = responseJson["status"].toString();
    });
    if (responseJson["status"] == "Success") {
      isLoading = false;
    } else {
      displayToast(responseJson["message"].toString());
      isLoading = false;
    }
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
          child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(""),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("Assets/Icons/back.png", height: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("My week timeline",
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w600,
                                    color: kwhite,
                                    fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.32,
                      child: isLoading
                          ? SpinKitFadingFour(
                              color: kwhite,
                              controller: AnimationController(
                                  vsync: this,
                                  duration: const Duration(milliseconds: 1200)),
                            )
                          : imagedata.toString() == "[]"
                              ? Center(
                                  child: Text("No data found",
                                      style: TextStyle(
                                          color: kwhite,
                                          fontFamily: "OpenSans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)))
                              : ListView.builder(
                                  itemCount:
                                      imagedata == null ? "" : imagedata.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              imagedata[index]["week"]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: kwhite,
                                                  fontFamily: "OpenSans",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Container(
                                              width: 0.2,
                                              color: kwhite,
                                              height: MediaQuery.of(context).size.height /2.5,
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
                                              child: ClipRRect(
                                                  child: FadeInImage(

                                                      width: MediaQuery.of(context).size.width/1.3,
                                                      height: MediaQuery.of(context).size.height/2.45,

                                                      image: NetworkImage(imagedata[index]["image_arr"]
                                                                          [0]["image"].toString() == ""
                                                          ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                                          : url2 + imagedata[index]["image_arr"][0]["image"].toString()),
                                                      //fit: BoxFit.fill,

                                                      placeholder: AssetImage(
                                                          "Assets/Images/giphy.gif"))),
                                            ),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (_) {
                                                return DetailScreen(
                                                    imagedata, index);
                                              })).then((value) => getImages());
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
  final url2 = url.imageUrl;
  PageController pageController = PageController(initialPage: 0);

  bool isLoading = true;

  var pageDeleteId;

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
      imageArray = responseJson["data"][widget.index]["image_arr"];
      print("dddd--- " + imageArray.toString());
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
                /*await FlutterShare.share(
                    title: 'Odiseea Sarcinii',
                    text: '',
                    linkUrl: url2 + imageArray[0]["image"].toString(),
                    chooserTitle: '');*/
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
                color: buttonColor,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              )
            : PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: imageArray == null ? "" : imageArray.length,
                itemBuilder: (context, index) {
                  return Hero(
                      tag: 'imageHero',
                      child: FadeInImage(
                          image: NetworkImage(
                            imageArray[index]["image"].toString() == ""
                                ? "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"
                                : url2 + imageArray[index]["image"].toString(),
                          ),
                          placeholder: AssetImage("Assets/Images/giphy.gif")));
                },
                onPageChanged: (page) {
                  setState(() {
                    pageDeleteId = imageArray[page]["id"];
                  });
                },
              ),
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
                          content: uploadphotosdialog(
                              widget.imagedata[widget.index]["week"])))
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
              print(pageDeleteId.toString());
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

                              var url = pageDeleteId.toString() == "null"
                                  ? "$url1/deleteImage/" +
                                      imageArray[0]["id"].toString()
                                  : "$url1/deleteImage/" +
                                      pageDeleteId.toString();

                              Map<String, String> header = {
                                "Authorization":
                                    prefs.getString("apiToken").toString()
                              };

                              final response = await http.get(Uri.parse(url),
                                  headers: header);

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
