import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/shared/utils.dart';

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
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
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
                        Text(historyItemEntity.name, style: GoogleFonts.openSans(fontSize: 12, color: primaryColor, fontWeight: FontWeight.bold)),
                        Text("28/02/2022 16:32", style: GoogleFonts.openSans(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(historyItemEntity.text,
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
            imageCache: CachedNetworkImageProvider("https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg"),
            image: "https://uploaddeimagens.com.br/images/003/700/538/original/272146181_6804132162995563_4295433218327981100_n.jpg",
          ),
        ),
      ],
    ),
  );

  Widget answer()=>Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(historyItemEntity.name, style: GoogleFonts.openSans(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("28/02/2022 16:32", style: GoogleFonts.openSans(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(historyItemEntity.text,
                    style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

}
