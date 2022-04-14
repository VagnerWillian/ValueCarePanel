import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/info_label.tile.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/utils/utils.dart';

class InfoSession extends StatelessWidget {
  final PatientEntity patientEntity;
  final List<ClassificationEntity> classifications;
  const InfoSession({required this.patientEntity, required this.classifications, Key? key}) : super(key: key);

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
                      child: ImageNetwork(
                        borderRadius: BorderRadius.circular(10),
                        height: 100,
                        width: 100  ,
                        onLoading: Container(),
                        imageCache: CachedNetworkImageProvider(patientEntity.photo),
                        image: patientEntity.photo,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(patientEntity.name, style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14), softWrap: true,),
                        Text(patientEntity.phone, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor), softWrap: true,),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Wrap(
                  children: [
                    SizedBox(
                      width: 120,
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
                                    color: classifications.singleWhere((c) => c.id==patientEntity.classification.id).color!.withOpacity(0.2)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(classifications.singleWhere((c) => c.id==patientEntity.classification.id).image, color: classifications.singleWhere((c) => c.id==patientEntity.classification.id).color, width: 16),
                                    const SizedBox(width: 10),
                                    Text(classifications.singleWhere((c) => c.id==patientEntity.classification.id).label, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: classifications.singleWhere((c) => c.id==patientEntity.classification.id).color)),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
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
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: const [
              InfoLabelTile(label: "CPF:", value: "477.354.788-15"),
              InfoLabelTile(label: "Nascimento:", value: "03/01/1996"),
              InfoLabelTile(label: "Gênero:", value: "Masculino"),
              InfoLabelTile(label: "Email:", value: "vagner@outlook.com"),
              InfoLabelTile(label: "Origem:", value: "Internet"),
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
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                ),
                child: Text("Editar dados", style: GoogleFonts.openSans(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 12)),
              )
            ],
          )
        ],
      ),
    );
  }
}
