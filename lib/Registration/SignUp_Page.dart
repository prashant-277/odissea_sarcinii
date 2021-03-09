import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Sign Up"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          color: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                      height: 75,
                      width: 75,
                      child: IconButton(
                          icon: Icon(
                            Icons.photo_size_select_actual_outlined,
                            size: 40,
                          ),
                          onPressed: () {}),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(width: 1),color: Colors.white38,)),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          cursorColor: Theme.of(context).primaryColor,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),color: Colors.white38,),
                        padding: EdgeInsets.only(left: 10, right: 10)
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                          cursorColor: Theme.of(context).primaryColor,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),color: Colors.white38,),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
