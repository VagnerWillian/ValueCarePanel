import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/utils.dart';

class ScoreColumnGrid extends StatelessWidget {
  final String value;

  const ScoreColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Text(value, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: primaryColor)),
    );
  }
}
