import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class ClassificationColumnGrid extends StatefulWidget {
  final int value;
  const ClassificationColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  _ClassificationColumnGridState createState() => _ClassificationColumnGridState();
}

class _ClassificationColumnGridState extends State<ClassificationColumnGrid> {

  late ClassificationEntity selectedClassification;
  bool loading = false;

  @override
  void initState() {
    selectedClassification = classifications.singleWhere((c) => c.id==widget.value);
    loading = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ClassificationColumnGrid oldWidget) {
    selectedClassification = classifications.singleWhere((c) => c.id==widget.value);
    loading = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loading?
         SizedBox(width: 20, height: 20,
          child: CircularProgressIndicator(
              color: secondColor,
          ),
        )
      :Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: selectedClassification.color!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
        ),
        height: 80,
        width: 150,
        child: DropdownButton<ClassificationEntity>(
          borderRadius: BorderRadius.circular(5),
          value: selectedClassification,
          underline: Container(),
          isExpanded: true,
          icon: Container(),
          iconDisabledColor: Colors.transparent,
          iconEnabledColor: selectedClassification.color,
          items: classifications.map((c) {
            return DropdownMenuItem<ClassificationEntity>(
                value: c,
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/classifications/${c.label}.svg", color: c.color, width: 20,),
                      const SizedBox(width: 10),
                      Text(c.label, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: c.color), overflow: TextOverflow.fade, softWrap: true,)
                    ],
                  ),
                ));
          }).toList(),
          onChanged: null,
        ),
      ),
    );
  }
}
