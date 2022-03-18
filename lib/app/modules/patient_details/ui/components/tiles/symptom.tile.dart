import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import '../../../../../utils/utils.dart';

class SymptomTile extends StatelessWidget {
  final String urlImage;
  final String title;
  final String description;
  const SymptomTile({Key? key, required this.urlImage, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: secondColor,
            ),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.redAccent,
              badgeShadow: BadgeShadow(color: Colors.black, elevation: 2),
              geometry: BadgeGeometry(width: 20, height: 20, cornerRadius: 5, alignment: BadgeAlignment.topLeft),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: SvgPicture.network(
                    urlImage,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
                    Text(description, style: GoogleFonts.cairo(color: Colors.white, fontSize: 10),)
                  ],
                )
              ],
            ),
          ),
          const Positioned(
              left: 2,
              top: 2,
              child: Icon(FontAwesomeIcons.check, color: Colors.white, size: 8))

        ],
      ),
    );
  }
}
