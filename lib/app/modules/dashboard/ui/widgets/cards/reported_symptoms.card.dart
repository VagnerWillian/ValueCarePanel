import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/tiles/symptom_appointments.tile.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/symptom.model.dart';
import 'package:value_panel/app/shared/utils.dart';

class SymptomReportedCard extends StatelessWidget {
  const SymptomReportedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(15),
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
          children: [
            Text('Sintomas Reportados', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18),),
            Text('Quantidade de vezes que os sintomas foram reportados', style: GoogleFonts.cairo(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.grey),),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, item)=>SymptomAppointmentsTile(symptom: Symptom(id: 1, label: "Febre"), value: 252, date: '03/01/1996'),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.all(10),
              child: OutlinedButton(
                onPressed: (){},
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(color: primaryColor)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                ),
                child: Text("Ver Analytics", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
