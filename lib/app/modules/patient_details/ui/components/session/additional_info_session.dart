import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tiles/additional_info.tile.dart';

class AdditionalInfoSession extends StatelessWidget {
  const AdditionalInfoSession({Key? key}) : super(key: key);

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
            blurRadius: 80,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(
        children: [
          Text("Informações Adicionais", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
          Expanded(
            child: ListView(
              children: const [
                AdditionInfoTile(urlImage: '', title: 'Covid Desde', value: "02/01/2020"),
                AdditionInfoTile(urlImage: '', title: 'Doenças Prévias', value: "Hipertensão, enfisema e/ou bronquite e/ou asma"),
                AdditionInfoTile(urlImage: '', title: 'Sintomas após 2 semanas?', value: "SIM"),
                AdditionInfoTile(urlImage: '', title: 'Perdeu peso?', value: "SIM • 10kg"),
                AdditionInfoTile(urlImage: '', title: 'Sentiu Febre?', value: "SIM • 37ºC"),
                AdditionInfoTile(urlImage: '', title: 'Vomitou?', value: "SIM"),
                AdditionInfoTile(urlImage: '', title: 'Altura', value: "1,65  "),
              ],
            ),
          )
        ],
      ),
    );
  }
}
