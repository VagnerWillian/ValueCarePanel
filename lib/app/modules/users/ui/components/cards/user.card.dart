import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class UserCard extends StatelessWidget {
  final UserEntity userEntity;
  const UserCard(this.userEntity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Card(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  userEntity.picture,
                              )
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          userEntity.name,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                        Text(
                          userEntity.levelAccess,
                          style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 12, color: primaryColor, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Icon(
                                  Icons.phone,
                                  color: primaryColor,
                                  size: 12,
                                ))),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text(userEntity.phone.isEmpty?"-":userEntity.phone, style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, softWrap: false)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Icon(
                                  Icons.email,
                                  color: primaryColor,
                                  size: 12,
                                ))),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text(userEntity.email.isEmpty?"-":userEntity.email, style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold))),
                      ],
                    )
                  ])),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero)),
                        onPressed: (){},
                        child: const Icon(LineAwesomeIcons.ellipsis_v, color: Colors.grey,)
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
