import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/COMMUNITY%20TAB/communityNews_page.dart';
import 'package:odiseea_sarcinii/WIDGETS/listtile.dart';
import 'package:odiseea_sarcinii/constants.dart';

class Community_page extends StatefulWidget {
  @override
  _Community_pageState createState() => _Community_pageState();
}

class _Community_pageState extends State<Community_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/background_new_me.png"),
          fit: BoxFit.fill,
        ),
        color: kwhite
      ),
      child: Column(
        children: [
          Text(""),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Community",
                  style: TextStyle(
                      color: kwhite,
                      fontSize: 25,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.37,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: listtiles(
                      text: "News",
                      imageName: "Assets/Icons/news.png",
                      onTapped: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            communityNews_page()));
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: listtiles(
                      text: "Wall",
                      imageName: "Assets/Icons/wall.png",
                      onTapped: () {},
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: listtiles(
                    text: "Forum",
                    imageName: "Assets/Icons/forum.png",
                    onTapped: () {},
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: listtiles(
                      text: "Group",
                      imageName: "Assets/Icons/group.png",
                      onTapped: () {},
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: listtiles(
                      text: "Message",
                      imageName: "Assets/Icons/message.png",
                      onTapped: () {},
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: listtiles(
                      text: "Store",
                      imageName: "Assets/Icons/store.png",
                      onTapped: () {},
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
