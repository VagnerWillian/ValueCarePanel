import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/week_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_value_chart.model.dart';
import 'package:value_panel/app/shared/components/charts/line_h.chart.dart';
import 'package:value_panel/app/shared/components/charts/models/chart.config.dart';
import 'package:value_panel/app/shared/components/charts/models/chart.data.item.dart';
import 'package:value_panel/app/shared/utils.dart';

class LineChartVertical extends StatelessWidget {
  final String description;
  final WeekGroupChartDataEntity weekGroup;
  late final ChartDataConfig _chartDataConfig;

  LineChartVertical({required this.weekGroup, required this.description, Key? key}) : super(key: key){
    List<ChartDataItem> chartItems = weekGroup.values.map((i) {
      BasicValueChartData data = i;
      return ChartDataItem(data.comparison, data.value);
    }).toList();
    _chartDataConfig = ChartDataConfig(group: chartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                              padding: MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: (){},
                          child: const Icon(LineAwesomeIcons.ellipsis_v, color: Colors.grey,)
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LineHChart(width: 430, height: 240, chartDataConfig: _chartDataConfig,),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weekGroup.quantity.toString(), style: GoogleFonts.cairo(fontWeight: FontWeight.w900, fontSize: 35)),
                          const SizedBox(width: 15),
                          Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: greenColor, size: 30,)
                        ],
                      ),
                      Text("Total de consultas", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)),
                      RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: weekGroup.comparison,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: greenColor),
                              ),
                              TextSpan(text: ' de aumento',
                                style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade500),
                              )
                            ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}