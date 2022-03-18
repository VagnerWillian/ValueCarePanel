import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/additional_info_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/info_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/sequels_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/symptom.tile.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_store.dart';

import '../../../shared/components/charts/models/double_line.chart.dart';

class PatientDetailsPage extends StatefulWidget {
  final String idPatient;
  const PatientDetailsPage({required this.idPatient, Key? key}) : super(key: key);

  @override
  PatientDetailsPageState createState() => PatientDetailsPageState();
}

class PatientDetailsPageState extends ModularState<PatientDetailsPage, PatientDetailsStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Perfil do Paciente", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    child: const DoubleLineChart(),
                  ),
                  Table(children: [
                    TableRow(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          InfoSession(),
                          SizedBox(height: 20),
                          SequelsSession(),
                        ],
                      ),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.fill,
                          child: Row(
                            children: const [
                              SizedBox(width: 20),
                              Expanded(child: AdditionalInfoSession()),
                            ],
                          )),
                    ]),
                  ]),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Sintomas Cadastrados", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    child: ScrollConfiguration(
                      behavior: HorizontalScrollBehavior(),
                      child: ListView(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: const [
                          SymptomTile(urlImage: "assets/images/symptoms/1.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/2.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/3.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/4.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/5.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/5.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/6.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/7.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                          SymptomTile(urlImage: "assets/images/symptoms/8.svg", title: "Insônia", description: "Você tem dificuldade para dormir"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}

class HorizontalScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}