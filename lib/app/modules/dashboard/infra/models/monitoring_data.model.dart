import 'package:intl/intl.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/symptom.model.dart';

class MonitoringData implements MonitoringDataEntity {

  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  int? classification;

  @override
  String? date;

  @override
  String? solicitationDate;

  @override
  bool? forward;

  @override
  String? id;

  @override
  String? patient;

  @override
  String? score;

  @override
  List<SymptomEntity>? symptoms;

  @override
  String get idString => "#$id";

  MonitoringData(
      {required this.id,
      required this.date,
      required this.symptoms,
      required this.patient,
      required this.score,
      required this.classification,
      required this.solicitationDate,
      required this.forward});

  MonitoringData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = datePattern.format(DateTime.parse(json['data']));
    symptoms = (json['sintomas'] as List).map((s) => Symptom.fromJson(s)).toList();
    patient = json['paciente'];
    score = json['score'];
    classification = json['classificacao'];
    solicitationDate = datePattern.format(DateTime.parse(json['dataSolicitada']));
    forward = json['encaminhar'];

  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.date;
    data['sintomas'] = symptoms?.map((e) => e.toJson).toList();
    data['paciente'] = patient;
    data['score'] = score;
    data['classificacao'] = classification;
    data['dataSolicitada'] = solicitationDate;
    data['encaminhar'] = forward;
    return data;
  }
}
