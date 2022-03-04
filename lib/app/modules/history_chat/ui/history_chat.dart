import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:value_panel/app/modules/history_chat/ui/components/ballons.component.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';
import 'package:flutter/material.dart';
import 'package:value_panel/app/utils/utils.dart';

class HistoryChat extends StatefulWidget {
  const HistoryChat({Key? key}) : super(key: key);

  @override
  HistoryChatState createState() => HistoryChatState();
}
class HistoryChatState extends ModularState<HistoryChat, HistoryChatStore> {

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_)=> Visibility(
        visible: store.selectedIdPatient!=null,
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: store.collapse,
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)) ,
                  child: Container(
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
                Expanded(
                  child: Observer(
                    builder: (_) => store.loading?Center(child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(color: primaryColor, strokeWidth: 1,),
                    )):Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: store.items.length,
                        itemBuilder: (context, item)=>Ballons(store.items[item]),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}