import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/info_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/session/sequels_session.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/info_label.tile.dart';
import 'package:value_panel/app/modules/patient_details/ui/patient_details_store.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../shared/components/page_title_description.widget.dart';

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20,),
            Text("Perfil Paciente", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
            Row(
              children: [
                Column(
                  children: const [
                    InfoSession(),
                    SequelsSession()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget additionalInfo() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 80,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Text("teste"),
    );
  }
}

