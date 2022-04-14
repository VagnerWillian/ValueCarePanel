import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';

import '../../../../../utils/utils.dart';

class AdditionInfoTile extends StatelessWidget {
  final String urlImage;
  final String title;
  final String value;
  const AdditionInfoTile({required this.urlImage, required this.title, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: value.isNotEmpty,
      maintainState: true,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                child: urlImage.isEmpty?Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor.withOpacity(0.2)),
                    ):ImageNetwork(
                  borderRadius: BorderRadius.circular(100),
                  height: 50,
                  width: 50,
                  onError: Container(color: primaryColor.withOpacity(0.2)),
                  onLoading: Container(),
                  imageCache: CachedNetworkImageProvider(urlImage),
                  image: urlImage,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
                  Text(value, style: GoogleFonts.openSans(fontWeight: FontWeight.w600, color: primaryColor, fontSize: 10),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
