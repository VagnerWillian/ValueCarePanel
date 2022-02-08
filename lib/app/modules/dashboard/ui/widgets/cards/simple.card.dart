import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/utils.dart';

class SimpleCard extends StatelessWidget {
  String label, value, comparation;
  SimpleCard({required this.label, required this.value, required this.comparation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 250,
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),),
              Row(
                children: [
                  Text(value, style: GoogleFonts.cairo(fontWeight: FontWeight.w900, fontSize: 25),),
                  const SizedBox(width: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: comparation.contains("+")?greenColor:Colors.redAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.show_chart_rounded, color: Colors.white, size: 12,),
                        const SizedBox(width: 5),
                        Text(comparation, style: GoogleFonts.openSans(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
