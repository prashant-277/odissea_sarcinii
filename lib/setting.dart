import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {

  void handleClick(String value) {
    switch (value) {
      case 'Logout from the application':
        print("Logout");
        break;
      case 'Settings':
        print("Setting");
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Logout from the application', 'Settings'}
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
