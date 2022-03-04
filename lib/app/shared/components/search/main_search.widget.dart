import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/utils/utils.dart';

class MainSearch extends StatelessWidget {
  final Function onTextChanged;
  const MainSearch({Key? key, required this.onTextChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 80,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            LineAwesomeIcons.search,
            color: primaryColor,
            size: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                onChanged: (str)=>onTextChanged(str),
                style: GoogleFonts.cairo(textStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Pesquise aqui", hintStyle: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 14, color: Colors.grey))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
