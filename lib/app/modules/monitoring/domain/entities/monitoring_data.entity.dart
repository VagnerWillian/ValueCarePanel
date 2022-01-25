import 'package:value_panel/app/modules/monitoring/infra/models/classification.model.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/symptom.model.dart';

abstract class MonitoringDataEntity {
  int? id;
  String? data;
  List<Symptom>? sintomas;
  String? paciente;
  String? score;
  Classification? classificacao;
  String? dataSolicitada;
  bool? encaminhar;

  String get idString => "#$id";

  MonitoringDataEntity(
      {this.id,
        this.data,
        this.sintomas,
        this.paciente,
        this.score,
        this.classificacao,
        this.dataSolicitada,
        this.encaminhar});

}
