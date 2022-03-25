import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

import '../../../../../utils/utils.dart';

class ReportedSymptomTile extends StatelessWidget {
  final String momentDate;
  final String symptomName;
  final String srcImage;
  final String situation;
  final String situationColor;
  final String description;
  final String descriptionDate;
  final bool isNew;
  final bool hasWarning;
  const ReportedSymptomTile(
      {Key? key, required this.momentDate,
      required this.symptomName,
      required this.srcImage,
      required this.situation,
      required this.situationColor,
      required this.description,
      required this.descriptionDate,
      required this.isNew,
      required this.hasWarning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              momentDate,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: situationColor.isEmpty?primaryColor:HexColor(situationColor),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Badge(
              shape: BadgeShape.square,
              showBadge: hasWarning,
              badgeContent: const Icon(LineAwesomeIcons.warning, color: Colors.white, size: 12,),
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: situationColor.isEmpty?primaryColor:HexColor(situationColor),
                ),
                child: Center(child: SvgPicture.network(srcImage, color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: isNew? '[NOVO] $symptomName - ':'$symptomName - ', style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' $situation', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: situationColor.isEmpty?primaryColor:HexColor(situationColor))),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: '$description - ', style: GoogleFonts.cairo(color: primaryColor)),
                        TextSpan(text: descriptionDate, style: GoogleFonts.openSans(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
