import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/utils/utils.dart';

class Balloon extends StatefulWidget {
  final HistoryItemEntity historyItemEntity;
  final Function(HistoryError failure) onError;
  final Function(int idHistoryItem, Function onError) deleteHistoryItem;
  final Function(int idHistoryItem, Function onError) markReadHistoryItem;
  Balloon(this.historyItemEntity, {required this.onError, required this.deleteHistoryItem, required this.markReadHistoryItem});

  @override
  State<Balloon> createState() => _BalloonState();
}

class _BalloonState extends State<Balloon> {

  bool readed = true;
  bool loading = false;

  void setLoading(bool value){
    setState(() => loading = value);
  }

  @override
  void initState() {
    readed = widget.historyItemEntity.hasRead;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              readed?Container(): Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 10, height: 10, child: CircleAvatar(backgroundColor: primaryColor)),
              Expanded(
                child: Shimmer.fromColors(
                  enabled: loading,
                  baseColor: Colors.black,
                  highlightColor: !loading?Colors.black:Colors.white,
                  child: Text(
                    widget.historyItemEntity.text,
                    style: GoogleFonts.cairo(
                        fontWeight: readed ? FontWeight.normal : FontWeight.bold, fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
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
  }

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
