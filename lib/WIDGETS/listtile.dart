import 'package:flutter/material.dart';

class listtiles extends StatelessWidget {
  final String text;
  final Function onTapped;
  final IconData icon;

  const listtiles({this.onTapped, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapped,
          title: Text(text),
          trailing: arrowIcon(),
          leading: Container(
              height: 60,
              width: 60,
              child: Icon(
                icon,
                color: Theme.of(context).accentColor,
                size: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border:
                    Border.all(width: 1, color: Theme.of(context).accentColor),
                color: Colors.white,
              )),
        ),
        SizedBox(height: 5),
        Divider(
          color: Colors.black45,
          indent: MediaQuery.of(context).size.width / 4.5,
          height: 5,
        ),
      ],
    );
  }
}

class arrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
