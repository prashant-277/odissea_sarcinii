import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odiseea_sarcinii/Tabs/Page.dart';

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
        color: Colors.black38,
      ),
      title: Text(
        'Home',
        style: TextStyle(color: Colors.black38),
      ),
      backgroundColor: Colors.purple[100],
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_outlined,
        color: Colors.black38,
      ),
      title: Text('Me', style: TextStyle(color: Colors.black38)),
      backgroundColor: Colors.purple[100],
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.child_care_rounded,
        color: Colors.black38,
      ),
      title: Text('Baby', style: TextStyle(color: Colors.black38)),
      backgroundColor: Colors.purple[100],
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.all_inbox,
        color: Colors.black38,
      ),
      title: Text('Community', style: TextStyle(color: Colors.black38)),
      backgroundColor: Colors.purple[100],
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline_rounded,
        color: Colors.black38,
      ),
      title: Text('Profile', style: TextStyle(color: Colors.black38)),
      backgroundColor: Colors.purple[100],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
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
