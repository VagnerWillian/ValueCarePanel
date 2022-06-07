import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

class Balloon extends StatefulWidget {

  final HistoryItemEntity historyItemEntity;
  final Function(HistoryError failure) onError;
  final Function(String idHistoryItem, Function onError) deleteHistoryItem;
  final Function(String idHistoryItem, Function onError) markReadHistoryItem;

  Balloon(this.historyItemEntity, {required this.onError, required this.deleteHistoryItem, required this.markReadHistoryItem});

  @override
  State<Balloon> createState() => _BalloonState();
}

class _BalloonState extends State<Balloon> {
  final ConfigManager _configManager = Modular.get();

  bool readed = true;
  bool loading = false;

  void setLoading(bool value){
    setState(() => loading = value);
  }

  void setReaded(bool value){
    setState(() => readed = value);
  }

  @override
  void initState() {
    readed = widget.historyItemEntity.hasRead;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Balloon oldWidget) {
    readed = widget.historyItemEntity.hasRead;
    loading = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Divider(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: !loading?buildItem:IgnorePointer(
            ignoring: true,
            child: Shimmer.fromColors(
              enabled: loading,
              baseColor: Colors.black,
              highlightColor: !loading?Colors.black:Colors.white,
              child: buildItem,
            ),
          )
        ),
      ],
    );
  }

  Widget get buildItem => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          readed?Container(): Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 10, height: 10, child: CircleAvatar(backgroundColor: primaryColor)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.historyItemEntity.text,
                  style: GoogleFonts.cairo(
                      fontWeight: readed ? FontWeight.normal : FontWeight.bold, fontSize: 12, color: Colors.black),
                ),
                Builder(
                    builder: (context) {
                      if(widget.historyItemEntity.idNewClassification==null){
                        return Container();
                      }
                      ClassificationEntity c = _configManager.classifications.singleWhere((c) => c.id==widget.historyItemEntity.idNewClassification!);
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: 120,
                          height: 35,
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: c.color!.withOpacity(0.1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(c.image, color: c.color, width: 16),
                              const SizedBox(width: 10),
                              Text(c.label, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: c.color)),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                widget.historyItemEntity.newAppointmentDate==null?Container():Center(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: OutlinedButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
                          onPressed: null,
                          icon: Icon(
                            Icons.calendar_today_rounded,
                            color: primaryColor,
                            size: 18,
                          ),
                          label: Text(
                            widget.historyItemEntity.newAppointmentDate!,
                            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
                          )),
                    ),
                  ),
                ),
                Builder(
                    builder: (context) {
                      if(widget.historyItemEntity.idNewSpecialty==null){
                        return Container();
                      }
                      SpecialtyEntity s = _configManager.specialties.singleWhere((s) => s.id==widget.historyItemEntity.idNewSpecialty);
                      return Center(
                        child: IgnorePointer(
                          ignoring: true,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: OutlinedButton.icon(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
                                onPressed: null,
                                icon: SvgPicture.asset(s.image, width: 20),
                                label: Text(
                                  s.label,
                                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
                                )),
                          ),
                        ),
                      );
                    }
                ),
                widget.historyItemEntity.newStatusConfirmation==null?Container():Center(
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: OutlinedButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 15))),
                          onPressed: null,
                          icon: Checkbox(
                              checkColor: widget.historyItemEntity.newStatusConfirmation!?Colors.white:greenColor,
                              fillColor: MaterialStateProperty.all(widget.historyItemEntity.newStatusConfirmation!?greenColor:Colors.grey),
                              value: widget.historyItemEntity.newStatusConfirmation!, onChanged: (v){}),
                          label: Text(
                            widget.historyItemEntity.newStatusConfirmation!?"Confirmado":"Não confirmado",
                            style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12, color: widget.historyItemEntity.newStatusConfirmation!?greenColor:Colors.black),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: loading?const SizedBox(
          height: 2,
          child: LinearProgressIndicator(),
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.historyItemEntity.data, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            readed
                ? InkWell(
                onTap: removeHistoryItem,
                child: const Text("Remover", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)))
                : InkWell(
                onTap: readHistoryItem,
                child: Text("Marcar como lido", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12)))
          ],
        ),
      ),
    ],
  );

  removeHistoryItem()async{
    setLoading(true);
    await widget.deleteHistoryItem(widget.historyItemEntity.id, widget.onError);
    setLoading(false);
  }

  readHistoryItem()async{
    setLoading(true);
    bool success = await widget.markReadHistoryItem(widget.historyItemEntity.id, widget.onError);
    setState(() {
      readed = success;
    });
    setLoading(false);
  }
}
