import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/reported_symptom_info.model.dart';

class ReportedSymptomGroup implements ReportedSymptomGroupEntity{

  @override
  late List<ReportedSymptomInfoEntity> items = [];

  @override
  late final String periodName;

  @override
  late final int score;

  ReportedSymptomGroup.fromJson(Map<String, dynamic> json) {
    periodName = json['periodo_nome'];
    score = json['score'];
    items = (json['items'] as List).map((json) => ReportedSymptomInfo.fromJson(json)).toList();
  }
}