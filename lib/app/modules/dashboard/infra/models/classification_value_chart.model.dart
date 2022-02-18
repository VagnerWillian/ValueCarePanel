import 'package:value_panel/app/modules/dashboard/domain/entities/chart/classification_value_chart.entity.dart';

class ClassificationValueChartData implements ClassificationValueChartDataEntity{

  @override
  String color = '';

  @override
  String label = '';

  @override
  String percent = '';

  @override
  int value = 0;

  ClassificationValueChartData();

  ClassificationValueChartData.fromJson(Map<String, dynamic> json) {
    color = json['cor'];
    label = json['label'];
    percent = json['porcentagem'];
    value = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valor'] = value;
    data['cor'] = color;
    data['porcentagem'] = percent;
    data['label'] = label;
    return data;
  }

}