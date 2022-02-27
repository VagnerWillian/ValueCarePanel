import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:value_panel/app/modules/home/ui/components/floating/history.component_store.dart';
import 'package:value_panel/app/shared/utils.dart';

class HistoryFloating extends StatefulWidget {
  const HistoryFloating({Key? key}) : super(key: key);

  @override
  _HistoryFloatingState createState() => _HistoryFloatingState();
}

class _HistoryFloatingState extends ModularState<HistoryFloating, HistoryFloatingStore> {


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_)=> Visibility(
        visible: store.show,
        child: Container(
            height: !store.isExpanded?40:500,
            width: 320,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.3),
                    spreadRadius: 0.6,
                    blurRadius: 60,
                    offset: const Offset(0, 0), // changes position of shadow
                  )
                ],
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: store.collapse,
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)) ,
                  child: Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text("Histórico do paciente", style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),)),
                        Row(
                          children: [
                            Icon(!store.isExpanded?FontAwesomeIcons.caretUp:FontAwesomeIcons.minus, color: Colors.white, size: 14),
                            IconButton(onPressed: store.close, icon: const Icon(FontAwesomeIcons.times, color: Colors.white, size: 14)),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        color: primaryColor
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
