import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/APP%20SETUP/Page.dart';

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
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      title: Text(
        'Home',
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_outlined,
      ),
      title: Text('Me'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.child_care_rounded,
      ),
      title: Text('Baby'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.all_inbox,
      ),
      title: Text('Community'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline_rounded,
      ),
      title: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        showUnselectedLabels: true,
        backgroundColor: Colors.orange[100],
        unselectedItemColor: Colors.black45,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 25,
        showSelectedLabels: true,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(color: Colors.black45, size: 25),
        selectedIconTheme:
            IconThemeData(color: Theme.of(context).accentColor, size: 25),
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
