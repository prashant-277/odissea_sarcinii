import 'dart:convert';

import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odiseea_sarcinii/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:odiseea_sarcinii/url.dart';
import 'package:http/http.dart' as http;

class weightChartpage extends StatefulWidget {
  @override
  _weightChartpageState createState() => _weightChartpageState();
}

class _weightChartpageState extends State<weightChartpage> {
  List<SalesData> chartData = [];
  final url1 = url.basicUrl;
  List weightList = [];

  @override
  void initState() {
    super.initState();
    getweightlist();
  }

  Future<String> getweightlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = "$url1/getWeightList";

    Map<String, String> header = {
      "Authorization": prefs.getString("apiToken").toString()
    };

    final response = await http.get(Uri.parse(url), headers: header);

    final responseJson = json.decode(response.body);
    print("weight tracker " + responseJson.toString());

    setState(() {
      for (Map i in responseJson["data"]) {
        setState(() {
          chartData.add(SalesData.fromJson(i));
        });
      }
    });
    return await rootBundle.loadString(responseJson["data"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Image.asset("Assets/Icons/add.png"),
        onPressed: () {},
      ),*/
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(
                title: AxisTitle(
                    text: "Week",
                    textStyle: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      color: buttonColor,
                      fontSize: 14,
                    )),axisLine: AxisLine(color: kblack)),
            primaryYAxis: CategoryAxis(
                title: AxisTitle(
                    text: "Weight",
                    textStyle: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: buttonColor,
                    )),axisLine: AxisLine(color: kblack)),
            title: ChartTitle(
                text: 'Overall Weight',
                textStyle: TextStyle(
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: buttonColor)),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),

            series: <ChartSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true),
            color: buttonColor,
            width: 3,

          )
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['current_week'].toString(),
      parsedJson['current_weight'],
    );
  }
}
