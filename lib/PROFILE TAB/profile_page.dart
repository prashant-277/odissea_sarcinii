import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/PROFILE%20TAB/editProfile.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/constants.dart';

class profile_page extends StatefulWidget {
  @override
  _profile_pageState createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kwhite,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Images/background_point.png"),
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
                        child: Image.asset("Assets/Icons/back.png", height: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          "My Profile",
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
                    height: 120,
                    width: 120,
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
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30, top: 40, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: kblack,
                        fontSize: 16),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          "loremipsum@gmail.com",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 14),
                        ),
                      ),
                      Image.asset(
                        "Assets/Icons/right_single.png",
                        height: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            indent: 30,
            endIndent: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EDOB",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w500,
                        color: kblack,
                        fontSize: 16),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          "19/10/2021",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 14),
                        ),
                      ),
                      Image.asset(
                        "Assets/Icons/right_single.png",
                        height: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: primarybutton("Edit Profile", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => editProfile()));
                })),
          )
        ],
      ),
    );
  }
}
