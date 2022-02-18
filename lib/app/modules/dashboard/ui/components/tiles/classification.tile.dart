import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/classification_value_chart.entity.dart';

class ClassificationTile extends StatelessWidget {
  final ClassificationValueChartDataEntity classificationValueChartData;
  const ClassificationTile({required this.classificationValueChartData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: HexColor(classificationValueChartData.color),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            const SizedBox(width: 15),
            Text('${classificationValueChartData.label}(${classificationValueChartData.percent})', style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),),
          ],
        ),
        Text(classificationValueChartData.value.toString(), style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),),
      ],
    );
  }
}
