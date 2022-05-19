import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/additional_info.session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/info_session.dart';
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
  final String idUserPatient;
  const PatientDetailsPage({required this.idPatient, required this.idUserPatient, Key? key}) : super(key: key);

  @override
  PatientDetailsPageState createState() => PatientDetailsPageState();
}

class PatientDetailsPageState extends ModularState<PatientDetailsPage, PatientDetailsStore> {

  @override
  void initState() {
    store.getPatientInfoDetails(onError: onError, idUserPatient: widget.idUserPatient, idPatient: widget.idPatient);
   /* SchedulerBinding.instance!.addPostFrameCallback((_) {
      Modular.get<HistoryChatStore>().open(idPatient: widget.idPatient, isFullHeight: true);
    });*/
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 45,
                          width: 110,
                          child: OutlinedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                              side: MaterialStateProperty.all(BorderSide(color: primaryColor))
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Modular.get<HistoryChatStore>().isFullHeight = false;
                            },
                            label: Text("Voltar", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: primaryColor),),
                            icon: Icon(LineAwesomeIcons.reply, color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Perfil do Paciente", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                    /*Observer(
                      builder: (_) => ScoreChartSession(values: store.scoreGraphicDataList, getScoreGraphicOfDates: store.getScoreGraphicOfDates, onError: onError)
                    ),*/
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
                                InfoSession(patientEntity: store.patientDetails!, classifications: store.configManager.classifications),
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
                            child: store.patientDetails!.symptoms.isEmpty?Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Nenhuma sequela cadastrada", style: GoogleFonts.cairo(color: Colors.grey, fontSize: 12)),
                              ],
                            ):ListView(
                              scrollDirection: Axis.horizontal,
                              children: store.patientDetails!.symptoms.map((v) => SymptomTile(urlImage: v.image, title: v.label, description: v.description, beforeCovid: v.beforeCovid)).toList(),
                            ),
                          ),
                        )
                    ),
                    Observer(
                      builder: (_) => SymptomsReportedSession(
                          idUserPatient: widget.idUserPatient,
                          idPatient: widget.idPatient,
                          value: store.reportedSymptomGroupEntity, onChangedDate: store.getReportedSymptomsOfPatientFromDate, onError: onError)
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