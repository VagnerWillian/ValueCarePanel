import 'package:value_panel/app/modules/monitoring/infra/models/symptom.model.dart';

abstract class MonitoringDataEntity {
  int? id;
  String? date;
  List<Symptom>? symptoms;
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
