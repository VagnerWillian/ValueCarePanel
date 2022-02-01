import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/shared/core/infra/models/classification.model.dart';

import 'core/domain/entities/classification.entity.dart';

//////////////// ROUTES ////////////////////////////
const  String DASHBOARD_ROUTE = "/dashboard";
const String MONITORING_ROUTE = "/monitoramento";
const String SCHEDULING_ROUTE = "/agendamento";


/////////////// COLORS //////////////////////////
final Color primaryColor = HexColor("#4B05C5");
final Color secondColor = HexColor("#425AD2");
final Color terciaryColor = HexColor("#7E1FE1");
final Color greyColor = HexColor("#A5A5A5");
final Color dialogBackgroundColor = Colors.white70;
final List<Color> gradientColors = [HexColor("#8A2CE6"), HexColor("#4F01C4"), HexColor("#4159D0")];

/////////////// CLASSIFICATIONS //////////////////////
final List<ClassificationEntity> classifications = [
  Classification(label: "Pendente", id: 0, color: HexColor("#6418C3")),
  Classification(label: "Não Urgente", id: 1, color: HexColor("#34A8D9")),
  Classification(label: "Emergência", id: 2, color: HexColor("#E23838")),
  Classification(label: "Urgente", id: 3, color: HexColor("#FFAB2D")),
  Classification(label: "Pouco Urgente", id: 4, color: HexColor("#38E25D")),
];