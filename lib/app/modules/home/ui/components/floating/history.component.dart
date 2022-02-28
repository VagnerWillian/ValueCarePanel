import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
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
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          children: [
                                            Text("Vagner Willian", style: GoogleFonts.openSans(fontSize: 12, color: primaryColor, fontWeight: FontWeight.bold)),
                                            Text("28/02/2022 16:32", style: GoogleFonts.openSans(fontSize: 12, color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Text("Registro de ação sobre a classificação do paciente e organização para procurar atendimento medico da PUCR.",
                                        style: GoogleFonts.openSans(fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: ImageNetwork(
                                borderRadius: BorderRadius.circular(100),
                                height: 40,
                                width: 40,
                                onLoading: Container(),
                                imageCache: const CachedNetworkImageProvider("https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg"),
                                image: "https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
