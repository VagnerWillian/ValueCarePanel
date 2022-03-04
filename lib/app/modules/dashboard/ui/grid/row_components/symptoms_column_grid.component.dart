import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class SymptomsColumnGrid extends StatelessWidget {
  final List<SymptomEntity> value;

  const SymptomsColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Badge(
            position: BadgePosition.topStart(),
            showBadge: value.length>1,
            padding: const EdgeInsets.all(7),
            badgeContent: Text("!", style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),),
            child: Container(
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
                child: Center(child: SvgPicture.network(value[0].srcImage, color: Colors.white))),
          ),
          const SizedBox(width: 5,),
          Flexible(
            child: RichText(
              maxLines: 3,
              text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: value[0].label,
                        style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                    ),
                    TextSpan(text: value.length>1?"\ne mais ${value.length-1}":"\nsomente",
                        style:GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey)
                    ),
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
