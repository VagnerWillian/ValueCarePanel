import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/components/custom/gradient.icon.dart';
import 'package:value_panel/app/shared/utils.dart';

class NewCasesCard extends StatelessWidget {
  final String description, textContent;
  final double value;
  final IconData? icon;
  final Function? goMonitoring, goScheduling;
  const NewCasesCard({Key? key, required this.value, this.icon, required this.description, this.textContent = '', required this.goMonitoring, required this.goScheduling}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage("assets/images/others/background_card.png"), fit: BoxFit.cover),
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon==null?Container():GradientIcon(
                        icon!,
                        55,
                        LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [
                          0.5,
                          1,
                        ], colors: [
                          primaryColor,
                          secondColor
                        ])),
                    Text(
                      value.toString(),
                      style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  description,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                Text(
                  textContent,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.openSans(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: ()=>goMonitoring!(),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          backgroundColor: MaterialStateProperty.all(primaryColor)),
                      child: Text("Monitoramento", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white))),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: ()=>goScheduling!(),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                          backgroundColor: MaterialStateProperty.all(Colors.white)),
                      child: Text("Agendamentos", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
