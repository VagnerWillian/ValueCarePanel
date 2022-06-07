import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:value_panel/app/shared/core/infra/models/level.model.dart';
import 'package:value_panel/app/shared/core/infra/models/specialty.model.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/classification.model.dart';

import '../shared/core/domain/entities/classification.entity.dart';
import '../shared/core/domain/entities/level.entity.dart';

bool MOCK = false;

//////////////// ROUTES ////////////////////////////
const String SPLASH_ROUTE = "/carregando/";
const String LOGIN_ROUTE = "/login/";
const String DASHBOARD_ROUTE = "/dashboard/";
const String MONITORING_ROUTE = "/monitoramento/";
const String SCHEDULING_ROUTE = "/agendamento/";
const String ANALYTICS_ROUTE = "/analytics/";
const String USERS_ROUTE = "/usuarios/";
const String CONFIG_ROUTE = "/configurações/";

const String PATIENTS_ROUTE = "/pacientes/";
const String PATIENT_DETAILS_ROUTE = "/pacientes/detalhes/";

////////////// SHARED PREFERENCES KEYS /////////////
const String FIRST_ACCESS_KEY = "FIRST_ACCESS_KEY_v1.0.0";
const String TOKEN_USER_LOGGED_KEY = "TOKEN_USER_LOGGED_KEY";
const String EMAIL_REMEMBER = "EMAIL_REMEMBER";

/////////////////// API /////////////////////////////

const String azureCode = "C5EwLNUjH3yItLs6PPuRH4RTVCLbiO9HEiIS4VdORxL8JWY/OatFZQ==";
const String baseUrl = "https://poscovidapp-admin.azurewebsites.net/api";
const String getMonitoringEP = "/Monitoramento?code=$azureCode";
const String getDashboardEP = "/Dashboard?code=$azureCode";
const String getUserEP = "/Operador?code=$azureCode";
const String postUserEP = "/Operador?code=$azureCode";
const String getUsersEP = "/Operadores?code=$azureCode";
const String getPatientDetailsInfoEP = "/usuario-paciente/";
const String postMonitoringUpdateEP = "/Monitoramento?code=$azureCode";
// --> Configuracoes Remotas API
const String getClassificationsEP = "/Classificacao?code=$azureCode";
const String getSpecialtiesEP = "/especialidade?code=$azureCode";


/////////////// COLORS //////////////////////////
final Color primaryColor = HexColor("#6418C3");
final Color secondColor = HexColor("#504EDF");
final Color tertiaryColor = HexColor("#7E1FE1");
final Color greyColor = HexColor("#A5A5A5");
final Color greenColor = HexColor("#38E25D");
final Color redColor = HexColor("#FF5E5E");
const Color dialogBackgroundColor = Colors.white70;
final List<Color> gradientColors = [HexColor("#4159D0"), HexColor("#4F01C4"), HexColor("#8A2CE6")];

//////////////// DATE PATTERNS FORMATS////////////////

final patternDdMm = DateFormat("dd/MM", "pt_BR");
final patternDdMmm = DateFormat("dd/MMM/yy", "pt_BR");
final patternDdMmmyyyy = DateFormat("dd/MM/yyyy", "pt_BR");
final patternHHmm = DateFormat("HH:mm", "pt_BR");
final patternWeekName = DateFormat("EEEE", "pt_BR");
final patternExtensive = DateFormat("EEEE, d 'de' MMMM 'de' y'\nàs' HH'h'mm'", "pt_BR");

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