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
                    radius: 40, // Increased radius for better visibility
                    title: 'Completed', // Display value as a title
                    titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    showTitle: true,
                  ),
                  PieChartSectionData(
                    value: 25,
                    color: Colors.blue,
                    radius: 40, // Increased radius for better visibility
                    title: 'Uncompleted', // Display value as a title
                    titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    showTitle: true,
                  ),
                ],
                centerSpaceRadius: 50, // Adjust the center space to create a donut effect
              ),
            ),
          ),
        ],
      ),
    );
  }
}
