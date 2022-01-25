import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/utils.dart';

class PatientNameColumnGrid extends StatelessWidget {
  final String value;
  const PatientNameColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 30,
              height: 30,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
              child: Center(child: SvgPicture.asset('assets/images/menu/pacientes.svg', color: primaryColor, width: 12,))),
          const SizedBox(width: 5,),
          Expanded(child: Text(value.toString(), style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}
