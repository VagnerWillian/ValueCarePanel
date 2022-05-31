import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/info_label.tile.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/utils/utils.dart';
import 'package:value_panel/app/utils/validators.dart';

import '../../../../../shared/components/dialogs/another_error.dialog.dart';
import '../../../../../shared/components/dialogs/repository_error.dialog.dart';
import '../../../errors/patient_details.errors.dart';

class InfoSession extends StatefulWidget {
  final PatientEntity patientEntity;
  final Function(String newOrigin, Function(PatientDetailsError failure)) saveOriginOfUser;
  final List<ClassificationEntity> classifications;
  const InfoSession({required this.patientEntity, required this.saveOriginOfUser, required this.classifications, Key? key}) : super(key: key);

  @override
  State<InfoSession> createState() => _InfoSessionState();
}

class _InfoSessionState extends State<InfoSession> {
  bool editOrigin = false;
  final TextEditingController originEditingController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void collapseEditOrigin(){
    setState(() {
      editOrigin = !editOrigin;
    });
  }

  showEditOrigin(bool value){
    setState(() {
      editOrigin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: widget.patientEntity.photo.isEmpty?Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200)):ImageNetwork(
                        borderRadius: BorderRadius.circular(10),
                        height: 100,
                        width: 100  ,
                        onLoading: Container(),
                        onError: Container(color: Colors.grey),
                        imageCache: CachedNetworkImageProvider(widget.patientEntity.photo),
                        image: widget.patientEntity.photo,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.patientEntity.name, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14), softWrap: true,),
                        Text(widget.patientEntity.phone, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor), softWrap: true,),
                      ],
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: Column(
                      children: [
                        Text("Classificação", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12),),
                        Row(
                          children: [
                            Text("", style: GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold, color: primaryColor)),
                            Container(
                              width: 120,
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: widget.patientEntity.classification.color!.withOpacity(0.2)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(widget.patientEntity.classification.image, color: widget.patientEntity.classification.color, width: 16),
                                  const SizedBox(width: 10),
                                  Text(widget.patientEntity.classification.label, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: widget.patientEntity.classification.color)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                 /* const SizedBox(width: 10),
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Score", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 12),),
                        Row(
                          children: [
                            Text(patientEntity.score.toString(), style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor)),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: greenColor
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.show_chart_rounded, color: Colors.white, size: 14,),
                                  const SizedBox(width: 10),
                                  Text("Melhorando", style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )*/
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              InfoLabelTile(label: "CPF:", value: widget.patientEntity.cpf),
              InfoLabelTile(label: "Nascimento:", value: widget.patientEntity.birthday),
              InfoLabelTile(label: "Gênero:", value: widget.patientEntity.gen),
              InfoLabelTile(label: "Email:", value: widget.patientEntity.email),
              editOrigin?Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                      validator: (str)=>Validators.validateMinCaracters(str!, minLength: 3),
                      style: GoogleFonts.cairo(fontSize: 12),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Alterar Origem",
                        hintStyle: GoogleFonts.cairo(fontSize: 12),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor))
                      ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(onTap: sendEditOrigin, child: const Icon(FontAwesomeIcons.check, size: 12, color: Colors.green))),
                  InkWell(onTap: collapseEditOrigin, child: const Icon(FontAwesomeIcons.times, size: 12, color: Colors.red))
                ],
              ):Row(
                children: [
                  InfoLabelTile(label: "Origem:", value: widget.patientEntity.origin),
                  IconButton(onPressed: collapseEditOrigin, icon: const Icon(FontAwesomeIcons.pen, size: 14, color: Colors.grey))
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              ElevatedButton.icon(
                onPressed: (){},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                ),
                icon: const Icon(FontAwesomeIcons.solidComments, color: Colors.white, size: 14),
                label: Text("Entrar em contato", style: GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(secondColor),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                ),
                child: Text("Ver Exames", style: GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              /*const SizedBox(width: 5),
              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                ),
                child: Text("Editar dados", style: GoogleFonts.openSans(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 12)),
              )*/
            ],
          )
        ],
      ),
    );
  }

  Future onError(PatientDetailsError failure) async {
    if (failure is PatientDetailsRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is PatientDetailsUnknownError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }

  Future sendEditOrigin()async{
    if(formkey.currentState!.validate()){
      await widget.saveOriginOfUser(originEditingController.text, onError);
      collapseEditOrigin();
    }
  }
}
