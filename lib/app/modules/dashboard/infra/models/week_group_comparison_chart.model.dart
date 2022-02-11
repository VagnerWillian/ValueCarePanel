import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/week_group_comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/comparison_chart.model.dart';

class WeekComparisonGroupChartData implements WeekComparisonGroupChartDataEntity{

  @override
  String comparison = '';

  @override
  int quantity = 0;

  @override
  List<ComparisonChartData> values = [];

  WeekComparisonGroupChartData();

  WeekComparisonGroupChartData.fromJson(Map<String, dynamic> json){
    comparison = json['comparacao'];
    quantity = json['quantidade'];
    values = (json['valores'] as List).map((e) {
      return ComparisonChartData.fromJson(e);
    }).toList();
  }

}