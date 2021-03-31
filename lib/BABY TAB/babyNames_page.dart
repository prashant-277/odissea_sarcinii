import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/BABY%20TAB/namesPage.dart';

class babyNames_page extends StatefulWidget {
  @override
  _babyNames_pageState createState() => _babyNames_pageState();
}

class _babyNames_pageState extends State<babyNames_page> {

  String name = "Name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 200,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name.toString()+" $index"),
                        Container(
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
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>namesPage(name)));
                    },
                  ),
                ),
                Divider(
                  indent: 30.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
