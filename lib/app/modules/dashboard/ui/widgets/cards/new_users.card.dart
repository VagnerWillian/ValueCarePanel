import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/components/custom/gradient.progress.dart';
import 'package:value_panel/app/shared/utils.dart';

class ProgressCard extends StatelessWidget {
  final String label, comparation;
  final double value;
  const ProgressCard({required this.label, required this.value, required this.comparation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 0), // changes position of shadow
          )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 7,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: GradientProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        gradient: LinearGradient(
                            colors: gradientColors,
                        ),
                        value: value,
                      ),
                    )
                  ),
                ),
                const SizedBox(width: 10),
                Text(value.toString(), style: GoogleFonts.cairo(fontWeight: FontWeight.w900, fontSize: 25),),
              ],
            ),
            RichText(
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: comparation,
                      style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: comparation.contains("+")?greenColor:redColor),
                    ),
                    TextSpan(text: ' relativo ao periodo anterior',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade500),
                    )
                  ]
              ),
            )
        ],),
      ),
    );
  }
}
