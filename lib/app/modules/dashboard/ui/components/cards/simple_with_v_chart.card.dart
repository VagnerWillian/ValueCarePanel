import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/utils/utils.dart';

class VChart extends StatelessWidget {
  final String label, comparation, description;
  final double value;

  const VChart({required this.label, required this.value, required this.comparation, this.description="", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 0), // changes position of shadow
            )],
          color: Colors.white
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),),
                Text(description, style: GoogleFonts.cairo(fontSize: 11),),
                Row(
                  children: [
                    Text(value.toString(), style: GoogleFonts.cairo(fontWeight: FontWeight.w900, fontSize: 25),),
                    const SizedBox(width: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 12,
                              top: comparation.contains("+")?35:5,
                              child: Text(comparation, style: GoogleFonts.openSans(color: comparation.contains("+")?greenColor:redColor, fontSize: 11, fontWeight: FontWeight.bold),)),
                          Icon(comparation.contains("+")?Icons.arrow_drop_up:Icons.arrow_drop_down, color: comparation.contains("+")?greenColor:redColor, size: 50,),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: IgnorePointer(
                  ignoring: true,
                  child: BarChart(
                      randomData()
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }

  BarChartData randomData() {

    return BarChartData(
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(showTitles: false),
      ),
      barGroups: [
        makeGroupData(0, value: 2, maxValue: 10, barColor: HexColor("#6418C3"), width: 8),
        makeGroupData(1, value: 3, maxValue: 10, barColor: HexColor("#6418C3"), width: 8),
        makeGroupData(2, value: 8, maxValue: 10, barColor: HexColor("#6418C3"), width: 8),
        makeGroupData(3, value: 3, maxValue: 10, barColor: HexColor("#6418C3"), width: 8),
      ],
      gridData: FlGridData(show: false),
    );
  }

  BarChartGroupData makeGroupData(int index,
    {required double value, required double maxValue,
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 10,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: index,
      showingTooltipIndicators: showTooltips,
      barRods: [
        BarChartRodData(
          y: isTouched ? value + 1 : value,
          colors: [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: maxValue,
            colors: [greyColor.withOpacity(0.2)],
          ),
        ),
      ],
    );
  }
}