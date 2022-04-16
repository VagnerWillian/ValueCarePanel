import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class PatientNameColumnGrid extends StatelessWidget {
  final MonitoringDataEntity value;
  final Function openPatientDetails;
  const PatientNameColumnGrid({required this.openPatientDetails, Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.grey)
        ),
        onPressed: ()=>openPatientDetails(value.idUserPatient, value.idPatient),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                child: Center(child: SvgPicture.asset('assets/images/menu/pacientes.svg', color: primaryColor, width: 12,))),
            const SizedBox(width: 5,),
            Expanded(child: Row(
              children: [
                Text(value.patient, style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600), overflow: TextOverflow.fade,),
                const Icon(LineAwesomeIcons.external_link, size: 14,)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
