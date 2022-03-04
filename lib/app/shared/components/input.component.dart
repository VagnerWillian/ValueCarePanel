import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/utils/utils.dart';

class InputTitle extends StatelessWidget {
  final Widget child;
  final String? label;
  const InputTitle({required this.child, this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label==null?Container():Text(
          label!,
          style: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14, color: greyColor),
        ),
        child
      ],
    );
  }
}
