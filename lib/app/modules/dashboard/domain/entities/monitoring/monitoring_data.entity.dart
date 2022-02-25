import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  String? date;
  List<SymptomEntity>? symptoms;
  String? patient;
  int? classification;
  String? solicitationDate;
  String? appointmentDate;
  bool? forward;

  String get idString;
  DateTime get dateSolicitedInDateTime;
  DateTime get appointmentDateInDateTime;

  MonitoringDataEntity(
      {this.date,
        this.symptoms,
        this.patient,
        this.classification,
        this.appointmentDate,
        this.solicitationDate,
        this.forward});

}
