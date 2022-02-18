import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/components/custom/gradient.progress.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/shared/utils.dart';

class SymptomAppointmentsTile extends StatelessWidget {
  final SymptomEntity symptom;
  final int quantity;
  final double percentage;
  final String date;
  const SymptomAppointmentsTile({required this.symptom, required this.quantity, required this.percentage, required this.date, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(0, 10), // changes position of shadow
                    )],
                ),
                child: Center(
                  child: SvgPicture.network(
                      symptom.srcImage,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(symptom.label, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('Sintoma', style: GoogleFonts.cairo(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: GradientProgressIndicator(
                  backgroundColor: primaryColor.withOpacity(0.2),
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                  value: percentage,
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                maxLines: 3,
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: quantity.toString(),
                          style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                      TextSpan(text: " Marcações",
                          style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black)
                      ),
                    ]
                ),
              ),
              Flexible(
                child: Text("Até a data $date", style:GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
