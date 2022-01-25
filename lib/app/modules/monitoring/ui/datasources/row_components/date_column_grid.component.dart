import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateColumnGrid extends StatelessWidget {
  final String value;

  const DateColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Text(value, style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal)),
    );
  }
}
