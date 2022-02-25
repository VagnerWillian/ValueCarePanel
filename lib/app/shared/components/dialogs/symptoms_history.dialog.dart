import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/shared/utils.dart';

class SymptomsHistoryDialog extends StatelessWidget {
  List<SymptomEntity> symptoms;
  final datePattern = DateFormat("dd/MM/yyyy 'às' hh:mm", "pt_BR");

  SymptomsHistoryDialog({required this.symptoms, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      decoration: BoxDecoration(),
      // padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: symptoms.map((s) => Container(
                  color: symptoms.indexOf(s)%2==0?Colors.grey.shade100:Colors.white,
                  // margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: SvgPicture.network(s.srcImage, color: Colors.white))),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(s.label,
                                  style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                              ),
                              Text(s.intensity,
                                  style:GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey)
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Reportado em:",
                              style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                          ),
                          Text(datePattern.format(DateTime.parse(s.dateReport)),
                              style:GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey)
                          ),
                        ],
                      )
                    ],
                  ),
                )).toList(),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: const Icon(
                FontAwesomeIcons.times,
                size: 20,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
