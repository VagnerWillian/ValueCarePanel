import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/additional_info.entity.dart';

import '../tiles/additional_info.tile.dart';

class AdditionalInfoSession extends StatelessWidget {
  final List<AdditionalInfoEntity> values;
  const AdditionalInfoSession({required this.values, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
        children: [
          Text("Informações Adicionais", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
          Expanded(
            child: ListView(
              children: values.map((v) => AdditionInfoTile(urlImage: v.urlImage, title: v.title, value: v.value)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
