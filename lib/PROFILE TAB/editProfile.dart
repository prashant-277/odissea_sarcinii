import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:odiseea_sarcinii/WIDGETS/primarybutton.dart';
import 'package:odiseea_sarcinii/WIDGETS/textfield.dart';
import 'package:odiseea_sarcinii/constants.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController dob_controller =
      TextEditingController(text: "19/10/202");
  TextEditingController username_controller =
      TextEditingController(text: "Cosmina stratan");
  TextEditingController email_controller =
      TextEditingController(text: "loremipsum@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Images/background2.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(""),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      "Assets/Icons/back.png",
                      fit: BoxFit.fill,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 25,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: kwhite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "Assets/Images/pic.png",
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "Assets/Icons/add_pic.png",
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: textfield(
                          controller: username_controller,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          prefixIcon: new IconButton(
                            icon: new Image.asset(
                              'Assets/Icons/user.png',
                              width: 20.0,
                              height: 20.0,
                              color: kblack,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: textfield(
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: email_controller,

                          prefixIcon: IconButton(
                            icon: new Image.asset(
                              'Assets/Icons/email.png',
                              width: 20.0,
                              height: 20.0,
                              color: kblack,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: GestureDetector(
                          onTap: () async {
                            DateTime date = await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1980, 3, 5),
                              maxTime: DateTime.now(),
                              onChanged: (date) {},
                              onConfirm: (date) {},
                              locale: LocaleType.en,
                              theme: DatePickerTheme(
                                backgroundColor: kwhite,
                                headerColor: statusbarColor,
                                containerHeight: 150,
                                itemStyle: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 15),
                                doneStyle: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: kwhite),
                                cancelStyle: TextStyle(
                                    fontFamily: "OpenSans",
                                    color: kwhite),
                              ),
                            );

                            setState(() {
                              date = date;
                              dob_controller.text = date.day.toString() +
                                  "-" +
                                  date.month.toString() +
                                  "-" +
                                  date.year.toString();
                            });
                          },
                          child: AbsorbPointer(
                            child: textfield(
                              controller: dob_controller,
                              obscureText: false,
                              textInputType: TextInputType.number,
                              prefixIcon: new IconButton(
                                icon: new Image.asset(
                                  'Assets/Icons/birthday.png',
                                  width: 20.0,
                                  height: 20.0,
                                  color: kblack,
                                ),
                                onPressed: null,
                              ),
                              suffixIcon: new IconButton(
                                icon: new Image.asset(
                                  'Assets/Icons/calender.png',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: primarybutton("Save", () {
                            Navigator.pop(context);
                          })),

                    ],
                  ),
                ),
              ),
            ),
            Text(""),

          ],
        ),
      ),
    );
  }
}
