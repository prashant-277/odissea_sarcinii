import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Page.dart';
import 'package:odiseea_sarcinii/constants.dart';

class Dashboard_Page extends StatefulWidget {
  @override
  _Dashboard_PageState createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {
  int _currentIndex = 0;
  final navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final _items = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new IconButton(
              icon: new Image.asset(_currentIndex == 0 ?
              'Assets/Icons/home_act.png' : "Assets/Icons/home.png",
              ),
              onPressed: null,
              iconSize: 35,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: new IconButton(
              icon: new Image.asset(_currentIndex == 1?'Assets/Icons/challenge_act.png':
              'Assets/Icons/challenge.png',
              ),
              onPressed: null,
              iconSize: 35,
            ),
            title: Text('Me'),
          ),
          BottomNavigationBarItem(
            icon: new IconButton(
              icon: new Image.asset(_currentIndex == 2?
              'Assets/Icons/baby_act.png':'Assets/Icons/baby.png',
              ),
              onPressed: null,
              iconSize: 35,
            ),
            title: Text('Baby'),
          ),
          BottomNavigationBarItem(
            icon: new IconButton(
              icon: new Image.asset(_currentIndex==3?
              'Assets/Icons/community_act.png':'Assets/Icons/community.png',
              ),
              onPressed: null,
              iconSize: 35,
            ),
            title: Text('Community'),
          ),
          BottomNavigationBarItem(
            icon: new IconButton(
              icon: new Image.asset(_currentIndex==4?
              'Assets/Icons/profile_act.png':'Assets/Icons/profile.png',
              ),
              onPressed: null,
              iconSize: 35,
            ),
            title: Text('Profile'),
          ),
        ],
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        elevation: 10,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontFamily: "OpenSans"),
        unselectedLabelStyle: TextStyle(fontFamily: "OpenSans"),

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      body: Stack(
        children: <Widget>[
          _buildPageOffstage(navigatorKeys[0], 0, "Home"),
          _buildPageOffstage(navigatorKeys[1], 1, "Me"),
          _buildPageOffstage(navigatorKeys[2], 2, "Baby"),
          _buildPageOffstage(navigatorKeys[3], 3, "Community"),
          _buildPageOffstage(navigatorKeys[4], 4, "Profile"),
        ],
      ),
    );

  }

  Widget _buildPageOffstage(
      GlobalKey<NavigatorState> key, int index, String s) {
    return Offstage(
      offstage: _currentIndex != index,
      child: CustomNavigator(

        navigatorKey: key,
        home: page(title: '$s'),
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }
}