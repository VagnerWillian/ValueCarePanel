import 'package:value_panel/app/modules/monitoring/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  int? id;
  String? data;
  List<SymptomEntity>? sintomas;
  String? paciente;
  String? score;
  String? classificacao;
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

  Map<String, dynamic> get toJson;

}
