import 'package:flutter/material.dart';

class Profile_page extends StatefulWidget {
  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange[100],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text("My Profile"),
                leading: Container(
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.person_rounded,
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
                title: Text("Buy Credit"),
                leading: Container(
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.credit_card_rounded,
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
                title: Text("Register / SignIn / SignOut"),
                leading: Container(
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.logout,
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
                title: Text("Terms & Conditions"),
                leading: Container(
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.title_rounded,
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
          ],
        ));
  }
}
