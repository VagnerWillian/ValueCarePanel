import 'package:value_panel/app/modules/dashboard/infra/models/comparison_chart.model.dart';

abstract class WeekComparisonGroupChartDataEntity{

  String comparison = '';
  int quantity = 0;
  List<ComparisonChartData> values = [];

}