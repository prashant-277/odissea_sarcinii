import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(false, 'M', 'Male'));
    sampleData.add(new RadioModel(false, 'F', 'Female'));
  }

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
      body: SingleChildScrollView(
        child: Container(
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
                          border: Border.all(width: 1),
                          color: Colors.white38,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                            cursorColor: Theme.of(context).primaryColor,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            color: Colors.white38,
                          ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                            cursorColor: Theme.of(context).primaryColor,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            color: Colors.white38,
                          ),
                          padding: EdgeInsets.only(left: 10, right: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "User Name",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_outline_rounded,
                                color: Colors.black26),
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
                height: 10,
              ),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lock_open_rounded,
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
                height: 10,
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
                height: 10,
              ),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Birth Date",
                        hintStyle: TextStyle(color: Colors.black26),
                        prefixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
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
                        ),
                        suffixIcon: Icon(
                          Icons.date_range,
                          color: Colors.black54,
                        )),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white38,
                  ),
                  padding: EdgeInsets.only(left: 5, right: 10)),
              SizedBox(
                height: 5,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 7.0, bottom: 0),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return new InkWell(
                          splashColor: Theme.of(context).primaryColor,
                          onTap: () {
                            setState(() {
                              sampleData.forEach(
                                  (element) => element.isSelected = false);
                              sampleData[index].isSelected = true;
                            });
                            print(sampleData[index].text);
                            print(sampleData[index].buttonText);
                          },
                          child: new RadioItem(sampleData[index]),
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white38,
                    ),
                  )),
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
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        children: <Widget>[
          new Container(
            height: 45.0,
            width: 45.0,
            child: new Center(
              child: new Text(_item.buttonText,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.purple[300] : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.purple[300] : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
