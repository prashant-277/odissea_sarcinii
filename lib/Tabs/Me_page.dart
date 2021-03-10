import 'package:flutter/material.dart';

class Me_page extends StatelessWidget {
  final String title;

  const Me_page({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.orange[100],
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Week"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Journal"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.assignment_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Questions"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.question_answer_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Groups"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.group_rounded,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Photos"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.photo_library_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("Doctor Visit"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.local_hospital_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("Weight Tracker"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("Plan Online"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.next_plan_outlined,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("Consultation"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.content_paste_sharp,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
              Divider(
                color: Colors.black45,
                indent: MediaQuery.of(context).size.width / 4.0,
                endIndent: MediaQuery.of(context).size.width / 6.5,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text("My Points"),
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.point_of_sale,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                            width: 1, color: Theme.of(context).accentColor),
                        color: Colors.white,
                      )),
                  trailing: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
            ],
          )),
    );
  }
}
