import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class listtiles extends StatelessWidget {
  final String text;
  final Function onTapped;
  final IconData icon;

  final String imageName;

  const listtiles({this.onTapped, this.text, this.icon, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(elevation: 5,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: kwhite,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0,top: 15.0),
          child: ListTile(
            focusColor: Colors.transparent,
            selectedTileColor: Colors.transparent,
            hoverColor: Colors.transparent,
            tileColor: kwhite,
            contentPadding: EdgeInsets.zero,
            onTap: onTapped,
            title: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
              ),
            ),
            trailing: arrowIcon(),
            leading: Image.asset(imageName),
          ),
        ),
      ),
    );
  }
}

class arrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "Assets/Icons/right_pink.png",
      height: 18,
    );
  }
}
