import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitleDescription extends StatelessWidget {
  final String title;
  final String? subtitle;
  const PageTitleDescription({
    Key? key,
    required this.title,
    this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width<1262?Container():Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
          text: TextSpan(
              children: [
                TextSpan(text: title,
                    style:GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)
                ),
                subtitle==null?WidgetSpan(child: Container()):TextSpan(text: "\n$subtitle",
                  style:GoogleFonts.cairo(fontSize: 14, color: Colors.grey),
                ),
              ])
      ),
    );
  }
}