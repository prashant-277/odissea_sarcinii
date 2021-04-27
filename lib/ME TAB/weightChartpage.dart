import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:odiseea_sarcinii/constants.dart';

class weightChartpage extends StatefulWidget {
  @override
  _weightChartpageState createState() => _weightChartpageState();
}

class _weightChartpageState extends State<weightChartpage> {
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "Exercise",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
    Feature(
      title: "Study",
      color: Colors.cyan,
      data: [0.5, 0.4, 0.85, 0.4, 0.7],
    ),
    Feature(
      title: "Water Plants",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "Grocery Shopping",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Image.asset("Assets/Icons/add.png"),
        onPressed: () {},
      ),
      body: (Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Overall weight",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: buttonColor,
                ),
              ),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: RichText(
                    text: TextSpan(
                      text: 'Weight',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: buttonColor,
                      ),
                      children: [
                        WidgetSpan(
                          child: RotatedBox(quarterTurns: -1, child: Text('')),
                        )
                      ],
                    ),
                  ),
                ),
                LineGraph(
                  features: [
                    Feature(
                      color: buttonColor,
                      data: [0.2, 0.8, 0.4, 0.7, 0.6],
                    ),
                  ],
                  size: Size(MediaQuery.of(context).size.width / 1.2,
                      MediaQuery.of(context).size.height / 1.8),
                  labelX: [
                    '0',
                    '5',
                    '10',
                    '15',
                    '20',
                    '25',
                    '30',
                    '35',
                    '40',
                    '45',
                    '50'
                  ],
                  labelY: ['40', '60', '80', '100', '120', '140', '160', '180'],
                  fontFamily: "OpenSans",
                  showDescription: false,
                  graphColor: kblack,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Week",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: buttonColor,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
