import 'package:intl/intl.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/symptom.model.dart';

class MonitoringData implements MonitoringDataEntity {

  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  int? classificacao;

  @override
  String? data;

  @override
  String? dataSolicitada;

  @override
  bool? encaminhar;

  @override
  int? id;

  @override
  String? paciente;

  @override
  String? score;

  @override
  List<Symptom>? sintomas;

  @override
  String get idString => "#$id";

  MonitoringData(
      {required this.id,
      required this.data,
      required this.sintomas,
      required this.paciente,
      required this.score,
      required this.classificacao,
      required this.dataSolicitada,
      required this.encaminhar});

  MonitoringData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = datePattern.format(DateTime.parse(json['data']));
    sintomas = (json['sintomas'] as List).map((s) => Symptom.fromJson(s)).toList();
    paciente = json['paciente'];
    score = json['score'];
    classificacao = json['classificacao'];
    dataSolicitada = datePattern.format(DateTime.parse(json['dataSolicitada']));
    encaminhar = json['encaminhar'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.data;
    data['sintomas'] = sintomas?.map((e) => e.toJson).toList();
    data['paciente'] = paciente;
    data['score'] = score;
    data['classificacao'] = classificacao;
    data['dataSolicitada'] = dataSolicitada;
    data['encaminhar'] = encaminhar;
    return data;
  }
}
