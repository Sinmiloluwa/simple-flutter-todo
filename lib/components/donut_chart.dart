import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonutChart extends StatefulWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 45,
                    color: Colors.yellow,
                    radius: 15,
                    showTitle: false
                  ),
                  PieChartSectionData(
                      value: 25,
                      color: Colors.blue,
                      radius: 15,
                      showTitle: false
                  )
                ]
              )
            ),
          ),
        ],
      ),
    );
  }
}