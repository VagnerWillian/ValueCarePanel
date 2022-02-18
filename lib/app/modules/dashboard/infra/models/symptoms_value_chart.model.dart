import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_value_chart.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/symptom.model.dart';

class SymptomsValueChartData implements SymptomValueChartDataEntity{

  @override
  double percentage = 0;

  @override
  SymptomEntity symptom = Symptom(id: 0, label: '');

  @override
  int quantity = 0;

  SymptomsValueChartData();

  SymptomsValueChartData.fromJson(Map<String, dynamic> json) {
    percentage = json['porcentagem']??0;
    symptom = Symptom.fromJson(json['sintoma']);
    quantity = json['quantidade']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['porcentagem'] = percentage;
    data['sintoma'] = symptom;
    data['quantidade'] = quantity;
    return data;
  }
}