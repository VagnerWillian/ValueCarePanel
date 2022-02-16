import 'package:value_panel/app/modules/dashboard/domain/entities/symptoms_value_chart.entity.dart';

class SymptomsValueChartData implements SymptomValueChartDataEntity{

  @override
  double percentage = 0;

  @override
  String symptom = 'Nan';

  @override
  int quantity = 0;

  SymptomsValueChartData();

  SymptomsValueChartData.fromJson(Map<String, dynamic> json) {
    percentage = json['porcentagem']??0;
    symptom = json['sintoma']??0;
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