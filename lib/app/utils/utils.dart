import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:value_panel/app/shared/core/infra/models/level.model.dart';
import 'package:value_panel/app/shared/core/infra/models/specialty.model.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/classification.model.dart';

import '../shared/core/domain/entities/classification.entity.dart';
import '../shared/core/domain/entities/level.entity.dart';

//////////////// ROUTES ////////////////////////////
const String LOGIN_ROUTE = "/login/";
const String DASHBOARD_ROUTE = "/dashboard/";
const String MONITORING_ROUTE = "/monitoramento/";
const String SCHEDULING_ROUTE = "/agendamento/";
const String ANALYTICS_ROUTE = "/analytics/";
const String USERS_ROUTE = "/users/";

const String PATIENTS_ROUTE = "/pacientes/";
const String PATIENT_DETAILS_ROUTE = "/pacientes/detalhes/";

////////////// SHARED PREFERENCES KEYS /////////////
const String FIRST_ACCESS_KEY = "FIRST_ACCESS_KEY_v1.0.0";
const String TOKEN_USER_LOGGED_KEY = "TOKEN_USER_LOGGED_KEY";
const String EMAIL_REMEMBER = "EMAIL_REMEMBER";

/////////////////// API /////////////////////////////

const String azureCode = "a6BpQlwHJoPw/5xNWHLJK9nhENctbinG8f9F/jw61QaEDERrHUespQ==";
const String baseUrl = "https://poscovidapp-admin.azurewebsites.net/api";
const String getMonitoringEP = "/Monitoramento?code=$azureCode";

/////////////// COLORS //////////////////////////
final Color primaryColor = HexColor("#6418C3");
final Color secondColor = HexColor("#504EDF");
final Color tertiaryColor = HexColor("#7E1FE1");
final Color greyColor = HexColor("#A5A5A5");
final Color greenColor = HexColor("#38E25D");
final Color redColor = HexColor("#FF5E5E");
const Color dialogBackgroundColor = Colors.white70;
final List<Color> gradientColors = [HexColor("#4159D0"), HexColor("#4F01C4"), HexColor("#8A2CE6")];

/////////////// CLASSIFICATIONS //////////////////////
final List<ClassificationEntity> classifications = [
  Classification(label: "Pendente", id: 0, color: HexColor("#6418C3")),
  Classification(label: "Não Urgente", id: 1, color: HexColor("#34A8D9")),
  Classification(label: "Emergência", id: 2, color: HexColor("#E23838")),
  Classification(label: "Urgente", id: 3, color: HexColor("#FFAB2D")),
  Classification(label: "Pouco Urgente", id: 4, color: HexColor("#38E25D")),
];

final List<SpecialtyEntity> specialties = [
  Specialty(id: 0, label: "Clínico Geral", image: "assets/assets/images/specialties/0.svg"),
  Specialty(id: 1, label: "Oftalmologista", image: "assets/assets/images/specialties/1.svg"),
  Specialty(id: 2, label: "Psicólogo", image: "assets/assets/images/specialties/2.svg"),
  Specialty(id: 3, label: "Pneumologista", image: "assets/assets/images/specialties/3.svg"),
  Specialty(id: 4, label: "Nefrologista", image: "assets/assets/images/specialties/4.svg"),
  Specialty(id: 5, label: "Traumatologista", image: "assets/assets/images/specialties/5.svg"),
  Specialty(id: 6, label: "Otorrinolaringologista", image: "assets/assets/images/specialties/6.svg"),
  Specialty(id: 7, label: "Endócrinologista", image: "assets/assets/images/specialties/7.svg"),
  Specialty(id: 8, label: "Cardiologista", image: "assets/assets/images/specialties/8.svg"),
  Specialty(id: 9, label: "Gastroenterologista", image: "assets/assets/images/specialties/9.svg"),
  Specialty(id: 10, label: "Fisioterapeuta", image: "assets/assets/images/specialties/10.svg"),
  Specialty(id: 11, label: "Dermatologista", image: "assets/assets/images/specialties/11.svg"),
];

//LEVELS
List<LevelAdminEntity> levels  = [
  LevelAdmin(id: 0, level: "Operador"),
  LevelAdmin(id: 1, level: "Gestor"),
  LevelAdmin(id: 2, level: "Administrador"),
];

final Map<int, String?> httpErrors = {
  // Errors from Dio
  0 :   "Tempo de limite esgotado",
  1 :   "Tempo de envio esgotado",
  2 :   "Tempo de recebimento esgotado",
  5 :   "Verifique sua conexão com a internet",

  // Erros from response
  401 : "Solicitação não autorizada, sessão expirada, entre novamente para continuar.",
  404 : "Não encontrado",
  500 : "Erro no servidor interno",
  503 : "Servidor indisponível"
};