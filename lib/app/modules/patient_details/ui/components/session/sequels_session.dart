import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/sequel_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/sequel_info.model.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/sequel_label.tile.dart';

class SequelsSession extends StatelessWidget {
  final List<SequelInfoEntity> values;
  const SequelsSession({this.values = const [], Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Sequelas", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
          values.isEmpty?Text("Nenhuma sequela cadastrada", style: GoogleFonts.cairo(color: Colors.grey, fontSize: 12)):Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            spacing: 15,
            children: values.map((v) => SequelLabelTile(label: v.label, value: v.value)).toList(),
          )
        ],
      ),
    );
  }
}
