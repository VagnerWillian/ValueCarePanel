import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/classification.entity.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/classification.model.dart';

/////////////// COLORS //////////////////////////
Color primaryColor = HexColor("#4B05C5");
Color secondColor = HexColor("#425AD2");
Color terciaryColor = HexColor("#7E1FE1");
Color greyColor = HexColor("#A5A5A5");
Color dialogBackgroundColor = Colors.white70;
List<Color> gradientColors = [HexColor("#8A2CE6"), HexColor("#4F01C4"), HexColor("#4159D0")];

/////////////// CLASSIFICATIONS //////////////////////
List<ClassificationEntity> classifications = [
  Classification(label: "Pendente", id: 0, color: HexColor("#6418C3")),
  Classification(label: "Não Urgente", id: 1, color: HexColor("#34A8D9")),
  Classification(label: "Emergência", id: 2, color: HexColor("#E23838")),
  Classification(label: "Urgente", id: 3, color: HexColor("#FFAB2D")),
  Classification(label: "Pouco Urgente", id: 4, color: HexColor("#38E25D")),
];