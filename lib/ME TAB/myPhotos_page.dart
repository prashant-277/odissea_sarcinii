import 'package:flutter/material.dart';

class myPhotos_page extends StatefulWidget {
  @override
  _myPhotos_pageState createState() => _myPhotos_pageState();
}

class _myPhotos_pageState extends State<myPhotos_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Photos"),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 41,
          itemBuilder: (_, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: Colors.white, width: 1),
                      color: Colors.black38,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.5, 0.6),
                  child: Container(
                      height: 20,
                      width: 20,
                      child: Center(child: Text("$index" ,style: TextStyle(fontSize: 12),)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                        color: Colors.orange[100],
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
