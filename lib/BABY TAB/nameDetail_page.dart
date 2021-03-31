import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class nameDetail_page extends StatefulWidget {
  @override
  _nameDetail_pageState createState() => _nameDetail_pageState();
}

class _nameDetail_pageState extends State<nameDetail_page>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("states of call" + "init");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("states of call" + "dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("states of call " + "resumed");
        break;
      case AppLifecycleState.paused:
        print("states of call" + "paused");
        break;
      case AppLifecycleState.inactive:
        print("states of call" + "inactive");
        break;
      case AppLifecycleState.detached:
        print("states of call" + " detached");
        break;

      default:
        print("states of call" + "default");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Name"),
            Text(
              "AJ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Gender"),
            Text(
              "Male",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Category"),
            Text(
              "American",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
