import 'package:flutter/material.dart';

class list_Doctorvisit extends StatefulWidget {
  @override
  _list_DoctorvisitState createState() => _list_DoctorvisitState();
}

class _list_DoctorvisitState extends State<list_Doctorvisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(child: Text("No Data Found")),
      ),
    );
  }
}
