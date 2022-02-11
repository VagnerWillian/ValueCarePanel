import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_chart.entity.dart';

class ComparisonChartData implements ComparisonChartDataEntity{
  @override
  double value = 0;

  @override
  String comparation = 'Nan';

  ComparisonChartData();

  ComparisonChartData.fromJson(Map<String, dynamic> json) {
    value = json['valor']??0;
    comparation = json['comparacao']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valor'] = value;
    data['comparacao'] = comparation;
    return data;
  }
}