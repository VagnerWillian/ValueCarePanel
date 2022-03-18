import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/sequel_label.tile.dart';
import 'package:value_panel/app/shared/components/page_title_description.widget.dart';

class SequelsSession extends StatelessWidget {
  const SequelsSession({Key? key}) : super(key: key);

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
            blurRadius: 80,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Sequelas", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            spacing: 15,
            children: const [
              SequelLabelTile(label: "Uso oxigênio em casa?", value: "SIM"),
              SequelLabelTile(label: "Embolia que precise de tratamento?", value: "SIM"),
              SequelLabelTile(label: "Paralisia ou fraqueza em um lado?", value: "SIM"),
              SequelLabelTile(label: "Pressão alta?", value: "SIM"),
              SequelLabelTile(label: "Dor generalizada?", value: "SIM"),
              SequelLabelTile(label: "Problema nos rins(hemodiálise)?", value: "SIM"),
              SequelLabelTile(label: "Problemas no coração(insuficiência, arritmia) que precise de tratamento?", value: "SIM"),
            ],
          )
        ],
      ),
    );
  }
}
