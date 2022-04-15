import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/history_chat/ui/components/ballons.component.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';
import 'package:value_panel/app/utils/utils.dart';
import 'package:value_panel/app/utils/validators.dart';

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
            height: !store.isExpanded?77:store.isFullHeight?MediaQuery.of(context).size.height-120:500,
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
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: store.collapse,
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(20),
                          child: Text("Encaminhamentos", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black))),
                      Row(
                        children: [
                          Icon(!store.isExpanded?FontAwesomeIcons.caretUp:FontAwesomeIcons.minus, color: primaryColor, size: 14),
                          IconButton(onPressed: store.close, icon: Icon(FontAwesomeIcons.times, color: primaryColor, size: 14)),
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: store.isExpanded,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (_) => store.loading?Center(child: SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(color: primaryColor, strokeWidth: 1,),
                            )):Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                controller: store.scrollController,
                                reverse: true,
                                shrinkWrap: true,
                                itemCount: store.items.length,
                                itemBuilder: (context, item)=>Ballons(store.items[item]),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Novo Registro", style: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 10),)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Form(
                                  key: store.formKey,
                                  child: TextFormField(
                                    validator: (str)=>Validators.validateEmpty(str),
                                    controller: store.textEditingController,
                                    maxLines: 5,
                                    minLines: 1,
                                    style: GoogleFonts.cairo(fontSize: 12),
                                    enabled: !store.loadingSend,
                                    decoration: InputDecoration(
                                      hintText: "Atualizar paciente...",
                                      hintStyle: GoogleFonts.cairo(fontSize: 12),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: Observer(
                                  builder: (_) => store.loadingSend?Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(
                                        height: 2,
                                        child: LinearProgressIndicator(color: primaryColor, backgroundColor: primaryColor.withOpacity(0.1),),
                                      ),
                                    ],
                                  ):Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            children: [
                                              Icon(LineAwesomeIcons.paperclip, color: primaryColor, size: 18,)
                                            ],
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                              onPressed: store.sendText,
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(primaryColor),
                                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                                              ),
                                              icon: const Icon(LineAwesomeIcons.send, color: Colors.white, size: 10),
                                              label: Text("Registrar", style: GoogleFonts.cairo(color: Colors.white, fontSize: 10),)),
                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}