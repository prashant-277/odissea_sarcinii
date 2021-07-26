// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/widgets.dart';
//
// import 'package:flutter/material.dart';
//
// class kick_Session_page extends StatefulWidget {
//   @override
//   _kick_Session_pageState createState() => _kick_Session_pageState();
// }
//
// class _kick_Session_pageState extends State<kick_Session_page> {
//   Stopwatch stopwatch;
//   Timer timer;
//
//   final Map<int, ValueChanged<String>> timerListeners =
//       Map<int, ValueChanged<String>>();
//
//   final List<ValueChanged<StopTimeItem>> timeListListener =
//       List<ValueChanged<StopTimeItem>>();
//
//   List<StopTimeItem> stopTimeList = List<StopTimeItem>();
//
//   int lastRecordedTime = 0;
//
//   TimerPageState() {
//     stopwatch = new Stopwatch();
//     timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
//   }
//
//   void callback(Timer timer) {
//     if (stopwatch.isRunning) {
//       timerListeners.forEach((key, value) {
//         if (key == TimeType.MinuteSecondType) {
//           value(TimerTextFormatter.formatSecond(stopwatch.elapsedMilliseconds));
//         } else {
//           value(TimerTextFormatter.formatMilli(stopwatch.elapsedMilliseconds));
//         }
//       });
//     }
//   }
//
//   void pauseStartButtonPressed() {
//     if (stopwatch.isRunning) {
//       String formattedTime =
//           TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
//       String formattedAddedTime = TimerTextFormatter.format(
//           stopwatch.elapsedMilliseconds - lastRecordedTime);
//       stopTimeList.add(StopTimeItem(formattedTime, formattedAddedTime));
//       print("${stopwatch.elapsedMilliseconds}");
//       lastRecordedTime = stopwatch.elapsedMilliseconds;
//
//       timeListListener.forEach((list) {
//         list(StopTimeItem(formattedTime, formattedAddedTime));
//       });
//       return;
//     }
//     setState(() {
//       if (!stopwatch.isRunning) {
//         stopTimeList.clear();
//         stopwatch.reset();
//         lastRecordedTime = 0;
//
//         timerListeners.forEach((key, value) {
//           if (key == TimeType.MinuteSecondType) {
//             value(TimerTextFormatter.formatSecond(0));
//           } else {
//             value(TimerTextFormatter.formatMilli(0));
//           }
//         });
//       }
//     });
//   }
//
//   void countButtonPressed() {
//     setState(() {
//       if (stopwatch.isRunning) {
//         stopwatch.stop();
//         timer.cancel();
//         timer = null;
//       } else {
//         timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
//         stopwatch.start();
//       }
//     });
//   }
//
//   Widget buildFloatingButton(String text, VoidCallback callback) {
//     TextStyle roundTextStyle =
//         const TextStyle(fontSize: 16.0, color: Colors.white);
//     return FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         child: new Text(text, style: roundTextStyle),
//         onPressed: callback);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("xia -- build TimerPage !!!");
//     return new Column(
//       children: <Widget>[
//         Container(
//             padding: const EdgeInsets.only(top: 25.0),
//             child: new Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TimeTextWidget(
//                     timerListeners: timerListeners,
//                     timeType: TimeType.MinuteSecondType,
//                   ),
//                   TimeTextWidget(
//                     timerListeners: timerListeners,
//                     timeType: TimeType.MilliType,
//                   ),
//                 ],
//               ),
//             )),
//         Container(
//           padding: const EdgeInsets.only(top: 25.0),
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 buildFloatingButton(
//                     stopwatch.isRunning ? "计数" : "复位", pauseStartButtonPressed),
//                 buildFloatingButton(
//                     stopwatch.isRunning ? "暂停" : "开始", countButtonPressed),
//               ]),
//         ),
//         Expanded(
//           child: Container(
//               margin: EdgeInsets.only(top: 25.0),
//               child: new Center(
//                 child: new TimeListWidget(
//                   stopTimeList: stopTimeList,
//                   timeListListener: timeListListener,
//                 ),
//               )),
//         )
//       ],
//     );
//   }
// }
//
// class TimeListWidget extends StatefulWidget {
//   TimeListWidget({this.stopTimeList, this.timeListListener});
//
//   List<ValueChanged<StopTimeItem>> timeListListener;
//   List<StopTimeItem> stopTimeList;
//
//   @override
//   TimeListState createState() => TimeListState();
// }
//
// class TimeListState extends State<TimeListWidget> {
//   @override
//   void initState() {
//     widget.timeListListener.add((list) {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int size = widget.stopTimeList.length;
//     return ListView.builder(
//       padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//       itemCount: size,
//       itemBuilder: (context, index) {
//         return LapTimeListItemWidget(
//             widget.stopTimeList[size - index - 1], index, size);
//       },
//     );
//   }
// }
//
// class LapTimeListItemWidget extends StatelessWidget {
//   StopTimeItem item;
//   int position;
//   int totalSize;
//
//   LapTimeListItemWidget(this.item, this.position, this.totalSize);
//
//   @override
//   Widget build(BuildContext context) {
//     print("xia build LapTimeListItemWidget position = $position");
//     return Column(
//       children: <Widget>[
//         ListTile(
//             title: Row(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     totalSize - position < 10
//                         ? "0${totalSize - position}"
//                         : "${totalSize - position}",
//                     style: TextStyle(color: Theme.of(context).primaryColor),
//                     maxLines: 1,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                   ),
//                   Text("${item.currentTime}"),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 "+${item.addedTime}",
//                 textAlign: TextAlign.right,
//                 style: TextStyle(color: Colors.black45),
//               ),
//             ),
//           ],
//         )),
//         Divider(
//           height: 2.0,
//           color: Colors.black38,
//         )
//       ],
//     );
//   }
// }
//
// class StopTimeItem {
//   String currentTime;
//   String addedTime;
//
//   StopTimeItem(this.currentTime, this.addedTime);
// }
//
// class TimeTextWidget extends StatefulWidget {
//   final Map<int, ValueChanged<String>> timerListeners;
//
//   final int timeType;
//
//   TimeTextWidget({this.timerListeners, this.timeType});
//
//   @override
//   State<StatefulWidget> createState() => TimeTextWidgetState();
// }
//
// class TimeTextWidgetState extends State<TimeTextWidget> {
//   String currentFormatedTime;
//
//   TimeTextWidgetState() {
//     print("xia -- SecondTextState !!!");
//   }
//
//   @override
//   void initState() {
//     if (widget.timeType == TimeType.MinuteSecondType) {
//       widget.timerListeners.addAll({TimeType.MinuteSecondType: _valueChanged});
//       currentFormatedTime = TimerTextFormatter.formatSecond(0);
//     } else {
//       widget.timerListeners.addAll({TimeType.MilliType: _valueChanged});
//       currentFormatedTime = TimerTextFormatter.formatMilli(0);
//     }
//   }
//
//   void _valueChanged(String elapsedTime) {
// //    print("xia -- build _valueChanged elapsedTime = $elapsedTime currentFormatedTime = $currentFormatedTime ");
//     if (elapsedTime != currentFormatedTime) {
//       setState(() {
//         currentFormatedTime = elapsedTime;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
// //    print("xia -- build SecondText !!!");
//     final TextStyle timerTextStyle =
//         const TextStyle(fontSize: 60.0, fontFamily: "Open Sans");
//     return new Text(currentFormatedTime, style: timerTextStyle);
//   }
// }
//
// class TimerTextFormatter {
//   static String format(int milliseconds) {
//     int hundreds = (milliseconds / 10).truncate();
//     int seconds = (hundreds / 100).truncate();
//     int minutes = (seconds / 60).truncate();
//
//     String minutesStr = (minutes % 60).toString().padLeft(2, '0');
//     String secondsStr = (seconds % 60).toString().padLeft(2, '0');
//     String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
//
//     return "$minutesStr:$secondsStr.$hundredsStr";
//   }
//
//   static String formatSecond(int milliseconds) {
//     int hundreds = (milliseconds / 10).truncate();
//     int seconds = (hundreds / 100).truncate();
//     int minutes = (seconds / 60).truncate();
//
//     String minutesStr = (minutes % 60).toString().padLeft(2, '0');
//     String secondsStr = (seconds % 60).toString().padLeft(2, '0');
//
//     return "$minutesStr:$secondsStr.";
//   }
//
//   static String formatMilli(int milliseconds) {
//     int hundreds = (milliseconds / 10).truncate();
//     int seconds = (hundreds / 100).truncate();
//     int minutes = (seconds / 60).truncate();
//
//     String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
//
//     return "$hundredsStr";
//   }
// }
//
// class TimeType {
//   static int MinuteSecondType = 0;
//   static int MilliType = 1;
// }
