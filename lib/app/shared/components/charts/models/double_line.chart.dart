import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/utils/utils.dart';

import 'chart.config.dart';
import 'chart.data.item.dart';

class DoubleLineChart extends StatefulWidget {
  final ChartDataConfig chartDataConfig;
  const DoubleLineChart({required this.chartDataConfig, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DoubleLineChartState();
}

class DoubleLineChartState extends State<DoubleLineChart> {
  final Color leftBarColor = HexColor("#5ECFFF");
  final Color rightBarColor_1 = HexColor("#6418C3");
  final Color rightBarColor_2 = HexColor("#FF5AEF");
  final double width = 10;

  List<BarChartGroupData> rawBarGroups = [];

  int touchedGroupIndex = -1;

  @override
  void initState() {
    widget.chartDataConfig.group
        .map((i) => rawBarGroups.add(makeGroupData(widget.chartDataConfig.group.indexOf(i), i.value, i.secondValue!)))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: BarChart(
          BarChartData(
            maxY: widget.chartDataConfig.maxY,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: primaryColor,
                tooltipRoundedRadius: 10,
                getTooltipItem: (_a, _b, _c, _d) =>
                    BarTooltipItem("Score: ${_a.barRods[_d].y}", GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => const TextStyle(color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                margin: 20,
                getTitles: (value) {
                  return widget.chartDataConfig.group[value.toInt()].bottomLabel;
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) => GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
                margin: 8,
                reservedSize: 28,
                interval: 1,
                getTitles: (value) {
                  if (value % widget.chartDataConfig.intervalY == 0 || value == widget.chartDataConfig.maxY) {
                    return value.toString();
                  }
                  return '';
                },
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: rawBarGroups,
            gridData: FlGridData(show: false),
          ),
        ));
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 5, x: x, barRods: [
      BarChartRodData(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(100), topLeft: Radius.circular(100)),
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(100), topLeft: Radius.circular(100)),
        y: y2,
        colors: [rightBarColor_2, rightBarColor_1],
        gradientColorStops: [0.1, 0.5],
        width: width,
      ),
    ]);
  }
}
