import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  late final String date;
  late final List<SymptomEntity> symptoms;
  late final String patient;
  int? classification;
  late final String solicitationDate;
  String? appointmentDate;
  bool? forward;

  String get idString;
  DateTime get dateSolicitedInDateTime;
  DateTime get appointmentDateInDateTime;

  MonitoringDataEntity(
      {required this.date,
        required this.symptoms,
        required this.patient,
        this.classification,
        this.appointmentDate,
        required this.solicitationDate,
        this.forward});

}
