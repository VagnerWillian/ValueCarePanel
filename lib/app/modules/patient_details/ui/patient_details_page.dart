import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/additional_info.session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/info_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/score_chart.session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/sequels_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/symptom.tile.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_store.dart';

import '../../../shared/components/dialogs/another_error.dialog.dart';
import '../../../shared/components/dialogs/repository_error.dialog.dart';
import '../../../utils/utils.dart';
import '../errors/patient_details.errors.dart';
import 'components/session/symptoms_reported.session.dart';

class PatientDetailsPage extends StatefulWidget {
  final String idPatient;
  const PatientDetailsPage({required this.idPatient, Key? key}) : super(key: key);

  @override
  PatientDetailsPageState createState() => PatientDetailsPageState();
}

class PatientDetailsPageState extends ModularState<PatientDetailsPage, PatientDetailsStore> {

  @override
  void initState() {
    store.getPatientInfoDetails(onError: onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
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
                    Observer(
                      builder: (_) => ScoreChartSession(values: store.scoreGraphicDataList, getScoreGraphicOfDates: store.getScoreGraphicOfDates, onError: onError)
                    ),
                    Observer(
                      builder: (_) => store.patientDetails==null ? Center(
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: FlareActor(
                            'assets/anims/loading.flr',
                            animation: 'loading',
                            color: primaryColor,
                          ),
                        ),
                      )
                          : Table(children: [
                          TableRow(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InfoSession(patientEntity: store.patientDetails!),
                                const SizedBox(height: 20),
                                SequelsSession(values: store.patientDetails!.sequels),
                              ],
                            ),
                            TableCell(
                                verticalAlignment: TableCellVerticalAlignment.fill,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Expanded(child: AdditionalInfoSession(values: store.patientDetails!.additionalInfo)),
                                  ],
                                )),
                          ]),
                        ])
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Sintomas Cadastrados", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_) => store.patientDetails==null?Container():SizedBox(
                          height: 65,
                          child: ScrollConfiguration(
                            behavior: HorizontalScrollBehavior(),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: store.patientDetails!.symptoms.map((v) => SymptomTile(urlImage: v.image, title: v.label, description: v.description)).toList(),
                            ),
                          ),
                        )
                    ),
                    Observer(
                      builder: (_) => SymptomsReportedSession(value: store.reportedSymptomGroupEntity, onChangedDate: store.getReportedSymptomsOfPatientFromDate, onError: onError)
                    )
                  ],
                ),
              ),
            ),
          ),
          MediaQuery.of(context).size.width < 1345 ? Container():
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
            child: Column(
              children: const [

              ],
            ),
          )
        ],
      ),
    );
  }

  Future onError(PatientDetailsError failure) async {
    if (failure is PatientDetailsRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is PatientDetailsUnknownError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
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