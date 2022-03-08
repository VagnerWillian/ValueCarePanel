import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  String? id;
  String? date;
  List<SymptomEntity>? symptoms;
  String? patient;
  String? score;
  int? classification;
  String? solicitationDate;
  bool? forward;

  String get idString;

  MonitoringDataEntity(
      {this.id,
        this.date,
        this.symptoms,
        this.patient,
        this.score,
        this.classification,
        this.solicitationDate,
        this.forward});

}
