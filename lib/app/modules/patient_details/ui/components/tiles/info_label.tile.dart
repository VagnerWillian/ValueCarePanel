import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/utils.dart';

class InfoLabelTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoLabelTile({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: "$label ", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: primaryColor)),
        TextSpan(
          text: value,
          style: GoogleFonts.cairo(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ])),
    );
  }
}
