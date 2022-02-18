import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/basic_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/tiles/classification.tile.dart';

class ClassificationsCard extends StatefulWidget {
  final BasicGroupChartDataEntity basicGroupChartDataEntity;
  const ClassificationsCard({required this.basicGroupChartDataEntity, Key? key}) : super(key: key);

  @override
  State<ClassificationsCard> createState() => _ClassificationsCardState();
}

class _ClassificationsCardState extends State<ClassificationsCard> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double maxWidth = 790;

    return Container(
      height: 130,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Classificações',
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            'Média de classificações no período',
            style: GoogleFonts.cairo(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
          ),
          Expanded(flex: 1,
            child: Padding(
              padding: EdgeInsets.all(screenWidth<maxWidth?0:30),
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    sections: showingSections()),
              ),
            ),
          ),
          Text(
            'Legenda',
            style: GoogleFonts.cairo(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: widget.basicGroupChartDataEntity.values.map((i) => ClassificationTile(classificationValueChartData: i)).toList(),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return widget.basicGroupChartDataEntity.values.map((i) {
      final isTouched = widget.basicGroupChartDataEntity.values.indexOf(i) == touchedIndex;
      final fontSize = isTouched ? 18.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
        color: HexColor(i.color),
        value: i.value,
        title: i.percent,
        radius: radius,
        titleStyle: GoogleFonts.cairo(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
      );
    }).toList();
  }
}
