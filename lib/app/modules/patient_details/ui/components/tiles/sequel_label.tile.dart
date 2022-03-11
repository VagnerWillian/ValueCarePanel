import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/utils/utils.dart';

class SequelLabelTile extends StatelessWidget {
  final String label;
  final String value;

  const SequelLabelTile({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: "$label ", style: GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.w600)),
      TextSpan(
        text: value,
        style: GoogleFonts.cairo(fontSize: 12, color: primaryColor, fontWeight: FontWeight.bold),
      ),
    ]));
  }
}
