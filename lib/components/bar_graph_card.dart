import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnalyticsBarChartState();
}

class AnalyticsBarChartState extends State<AnalyticsBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0x002c4260),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                    ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                    color: Color(0xff000000), fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Raleway'),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mon';
                    case 1:
                      return 'Tue';
                    case 2:
                      return 'Wed';
                    case 3:
                      return 'Thu';
                    case 4:
                      return 'Fri';
                    case 5:
                      return 'Sat';
                    case 6:
                      return 'Sun';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: <BarChartGroupData>[
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(y: 8, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),],)
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(y: 10, width: 15,colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(y: 14, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(y: 15, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(y: 13, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(y: 10, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(y: 18, width: 15, colors: [Color(0xfffbb089), Color(0xffff4745),])
                ],
                showingTooltipIndicators: [0],
              ),
            ],
          ),
        ),
      ),
    );
  }
}