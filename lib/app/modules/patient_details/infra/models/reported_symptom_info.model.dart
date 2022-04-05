import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_info.entity.dart';

class ReportedSymptomInfo implements ReportedSymptomInfoEntity{
  @override
  late final String color;

  @override
  late final String image;

  @override
  late final String moment;

  @override
  late final String comparison;

  @override
  late final String comparisonDate;

  @override
  late final String symptomName;

  @override
  late final String symptomSituation;

  @override
  late final bool isNew;

  @override
  late final bool isWarning;

  ReportedSymptomInfo.fromJson(Map<String, dynamic> json) {
    symptomName = json['sintoma'];
    symptomSituation = json['situacao'];
    color = json['cor'];
    image = json['imagem'];
    moment = json['momento'];
    comparison = json['comparacao'];
    comparisonDate = json['comparacao_data'];
    isWarning = json['aviso'];
    isNew = json['novo'];
  }

}