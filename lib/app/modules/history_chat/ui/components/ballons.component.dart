import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class Ballons extends StatelessWidget{
  late final HistoryItemEntity historyItemEntity;
  Ballons(this.historyItemEntity);

  @override
  Widget build(BuildContext context) {
    if(historyItemEntity.isAnswer){
      return answer();
    }
    return question();
  }

  Widget question()=>Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(historyItemEntity.name, style: GoogleFonts.openSans(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.right),
                      Text(historyItemEntity.data, style: GoogleFonts.openSans(fontSize: 10, color: Colors.black),textAlign: TextAlign.right,),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(historyItemEntity.text,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.openSans(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 25,
          height: 25,
          child: ImageNetwork(
            borderRadius: BorderRadius.circular(100),
            height: 35,
            width: 35,
            onLoading: Container(),
            imageCache: CachedNetworkImageProvider(historyItemEntity.photo),
            image: historyItemEntity.photo,
          ),
        ),
      ],
    ),
  );

  Widget answer()=>Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: ImageNetwork(
            borderRadius: BorderRadius.circular(100),
            height: 35,
            width: 35,
            onLoading: Container(),
            imageCache: CachedNetworkImageProvider(historyItemEntity.photo),
            image: historyItemEntity.photo,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(historyItemEntity.name, style: GoogleFonts.openSans(fontSize: 10, color: primaryColor, fontWeight: FontWeight.bold)),
                      Text(historyItemEntity.data, style: GoogleFonts.openSans(fontSize: 10, color: primaryColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(historyItemEntity.text,
                  style: GoogleFonts.openSans(fontSize: 10, color: primaryColor),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );

}
