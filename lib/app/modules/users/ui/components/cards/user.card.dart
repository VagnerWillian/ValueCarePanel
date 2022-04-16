import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/users/errors/users_errors.dart';
import 'package:value_panel/app/shared/core/domain/entities/user.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class UserCard extends StatefulWidget {
  final UserEntity userEntity;
  final Function(UsersError failure) onError;
  final Function({required String operatorId, required Function(UsersError failure) onError}) activateOperator;
  final Function({required String operatorId, required Function(UsersError failure) onError}) deactivateOperator;
  final Function({required String operatorId, required Function(UsersError failure) onError}) deleteOperator;
  const UserCard(this.userEntity, this.onError ,this.activateOperator, this.deactivateOperator, this.deleteOperator, {Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  bool loading = false;

  setLoading(bool value){
    setState(() => loading=value);
  }

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
      child: Opacity(
        opacity: widget.userEntity.userActive?1:0.4,
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
                                    widget.userEntity.picture,
                                )
                              )
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.userEntity.name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          Text(
                            widget.userEntity.levelAccess,
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
                          Expanded(child: Text(widget.userEntity.phone.isEmpty?"-":widget.userEntity.phone, style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, softWrap: false)),
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
                          Expanded(child: Text(widget.userEntity.email.isEmpty?"-":widget.userEntity.email, style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.bold))),
                        ],
                      )
                    ])),
                loading?SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(
                    color: primaryColor,
                    backgroundColor: primaryColor.withOpacity(0.5),
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: loading?Container():ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                              padding: MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: (){},
                          child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(LineAwesomeIcons.ellipsis_v, color: Colors.grey),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: deleteOperator,
                                  child: Row(children: [
                                    const Icon(LineAwesomeIcons.trash, color: Colors.red, size: 18),
                                    const SizedBox(width: 10),
                                    Text("Excluir", style: GoogleFonts.cairo(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),)
                                  ],),
                                ),
                                widget.userEntity.userActive?PopupMenuItem(
                                  onTap: deactivateOperator,
                                  child: Row(children: [
                                    const Icon(FontAwesomeIcons.lock, color: Colors.grey, size: 16),
                                    const SizedBox(width: 10),
                                    Text("Desativar", style: GoogleFonts.cairo(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),)
                                  ])):PopupMenuItem(
                                  onTap: activateOperator,
                                child: Row(children: [
                                Icon(FontAwesomeIcons.unlock, color: primaryColor, size: 16),
                                const SizedBox(width: 10),
                                Text("Ativar", style: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 12),)
                              ]),
                                ),
                              ]
                          )
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future activateOperator()async{
    setLoading(true);
    await widget.activateOperator(operatorId: widget.userEntity.id, onError: widget.onError);
    setLoading(false);
  }

  Future deactivateOperator()async{
    setLoading(true);
    await widget.deactivateOperator(operatorId: widget.userEntity.id, onError: widget.onError);
    setLoading(false);
  }

  Future deleteOperator()async{
    setLoading(true);
    await widget.deleteOperator(operatorId: widget.userEntity.id, onError: widget.onError);
    setLoading(false);
  }
}
