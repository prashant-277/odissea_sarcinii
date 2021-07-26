import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final AppBar appBar;
  final List<Widget> widgets;

  final String appbartext;

  const BaseAppBar({Key key, this.appBar, this.widgets, this.appbartext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,

      backgroundColor: statusbarColor,
      title: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: EdgeInsets.only(left: 0),
        onPressed: () {
          Navigator.pop(context);
        },
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context,true);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "Assets/Icons/back.png",
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  appbartext,
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      color: kwhite,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
