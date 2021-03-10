import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword_Page extends StatefulWidget {
  @override
  _ForgotPassword_PageState createState() => _ForgotPassword_PageState();
}

class _ForgotPassword_PageState extends State<ForgotPassword_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        automaticallyImplyLeading: false,
        title: Text("Forgot Password"),
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange[100],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text(
                    "Please Submit your email address related to account.",
                    textAlign: TextAlign.center,
                  )),
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.black26,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              width: 1,
                              color: Colors.black26,
                            ),
                          )
                        ],
                      )),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  color: Colors.white38,
                ),
                padding: EdgeInsets.only(left: 5, right: 10)),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.purple[300],
              width: MediaQuery.of(context).size.width / 3,
              height: 35,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
