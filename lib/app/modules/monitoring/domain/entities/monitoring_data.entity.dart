import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  int? id;
  List<SymptomEntity>? symptoms;
  String? patient;
  int? classificationId;
  int? specialtyId;
  String? solicitationDate;
  String? appointmentDate;
  bool? confirm;

  String get idString;
  DateTime? get appointmentDateInDateTime;

  MonitoringDataEntity(
      {this.id,
        this.symptoms,
        this.patient,
        this.classificationId,
        this.specialtyId,
        this.appointmentDate,
        this.solicitationDate,
        this.confirm});

}
