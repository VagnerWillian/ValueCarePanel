import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/shared/utils.dart';

class HistoryColumnGrid extends StatelessWidget {
  final int value;

  const HistoryColumnGrid({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
      height: 40,
      width: 40,
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(5)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)))
          ),
          onPressed: (){},
          child: SvgPicture.network("assets/images/menu/history.svg", width: 20,)),
    ));
  }
}
