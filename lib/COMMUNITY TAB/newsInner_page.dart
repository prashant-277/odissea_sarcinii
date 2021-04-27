import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/WIDGETS/appbarCustom.dart';
import 'package:odiseea_sarcinii/constants.dart';

class newsInner_page extends StatefulWidget {
  @override
  _newsInner_pageState createState() => _newsInner_pageState();
}

class _newsInner_pageState extends State<newsInner_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: BaseAppBar(
        appbartext: "Sarcina",
        appBar: AppBar(),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsInner_page()));
                    },
                    title: Text(
                      "Main title",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          color: kblack,
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is placeholder text lorem commonly.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 12),
                        ),
                        Text(
                          "4 hr ago",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    leading: Image.asset(
                      "Assets/Icons/mask_group_5.png",
                      height: 70,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsInner_page()));
                    },
                    title: Text(
                      "Main title",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          color: kblack,
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is placeholder text lorem commonly.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 12),
                        ),
                        Text(
                          "4 hr ago",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    leading: Image.asset(
                      "Assets/Icons/mask_group_1.png",
                      height: 70,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsInner_page()));
                    },
                    title: Text(
                      "Main title",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          color: kblack,
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is placeholder text lorem commonly.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 12),
                        ),
                        Text(
                          "4 hr ago",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    leading: Image.asset(
                      "Assets/Icons/mask_group_2.png",
                      height: 70,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsInner_page()));
                    },
                    title: Text(
                      "Main title",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          color: kblack,
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is placeholder text lorem commonly.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 12),
                        ),
                        Text(
                          "4 hr ago",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    leading: Image.asset(
                      "Assets/Icons/mask_group_3.png",
                      height: 70,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsInner_page()));
                    },
                    title: Text(
                      "Main title",
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w700,
                          color: kblack,
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is placeholder text lorem commonly.",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: kblack,
                              fontSize: 12),
                        ),
                        Text(
                          "4 hr ago",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                              fontSize: 8),
                        ),
                      ],
                    ),
                    leading: Image.asset(
                      "Assets/Icons/mask_group_4.png",
                      height: 70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
