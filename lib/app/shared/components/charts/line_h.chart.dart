import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/components/charts/models/chart.config.dart';
import 'package:value_panel/app/utils/utils.dart';

class LineHChart extends StatefulWidget {
  final double width, height;
  final ChartDataConfig chartDataConfig;
  const LineHChart({required this.width, required this.height, required this.chartDataConfig, Key? key}) : super(key: key);

  @override
  _LineHChartState createState() => _LineHChartState();
}

class _LineHChartState extends State<LineHChart> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: LineChart(mainData(),
            swapAnimationDuration: const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
           ));
  }

  LineChartBarData _lineBarChartData()=>LineChartBarData(
    spots: widget.chartDataConfig.group.map((i) => FlSpot(widget.chartDataConfig.group.indexOf(i).toDouble(), i.value)).toList(),
    isCurved: true,
    colors: gradientColors,
    barWidth: 5,
    dotData: FlDotData(
        show: true,
        getDotPainter:(a,b,c,d){
          return FlDotCirclePainter(strokeWidth: 4, strokeColor: Colors.white, color: primaryColor);
        }
    ),
    // preventCurveOverShooting: true,
    aboveBarData: BarAreaData(
      spotsLine: BarAreaSpotsLine(
          show: true,
          flLineStyle: FlLine(color: Colors.grey.shade300, strokeWidth: 0.5)),
      show: true,
      colors: [Colors.white],
    ),
    belowBarData: BarAreaData(
      spotsLine: BarAreaSpotsLine(
          show: true,
          flLineStyle: FlLine(color: Colors.grey.shade300, strokeWidth: 0.5)),
      show: true,
      colors: gradientColors.map((color) => color.withOpacity(0.1)).toList(),
    ),
  );


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: false,
          getDrawingVerticalLine: (value) {
            return FlLine(
                color: Colors.grey.shade100,
                strokeWidth: 1);
          }
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 10,
          ),
          getTitles: (value) {
            return widget.chartDataConfig.group[value.toInt()].bottomLabel;
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => GoogleFonts.cairo(
            fontWeight: FontWeight.w900,
            color: Colors.grey,
            fontSize: 9,
          ),
          getTitles: (value) {
            if(value%widget.chartDataConfig.intervalY==0||value==widget.chartDataConfig.maxY){
              return value.toString();
            }
            return '';
          },
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0, maxX: widget.chartDataConfig.maxX, minY: 0, maxY: widget.chartDataConfig.maxY,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: primaryColor,
          tooltipRoundedRadius: 8,
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
            return lineBarsSpot.map((lineBarSpot) {
              return LineTooltipItem(
                lineBarSpot.y.toString(),
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            }).toList();
          },
        ),
      ),
      lineBarsData: [
        _lineBarChartData()
      ],
      showingTooltipIndicators: _lineBarChartData().spots
          .map((e) => _lineBarChartData().spots.indexOf(e))
          .map((index) => ShowingTooltipIndicators([
        LineBarSpot(_lineBarChartData(), index,
            _lineBarChartData().spots[index]),
      ]))
          .toList(),
    );
  }
}
