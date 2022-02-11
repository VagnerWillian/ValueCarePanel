import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/week_group_comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/comparison_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/week_group_comparison_chart.model.dart';

abstract class ComparisonGroupChartDataEntity{
  ComparisonChartDataEntity activeUsers = ComparisonChartData();
  ComparisonChartDataEntity reportedSymptons = ComparisonChartData();
  ComparisonChartDataEntity appointments = ComparisonChartData();
  ComparisonChartDataEntity newUsers = ComparisonChartData();
  ComparisonChartDataEntity newCases = ComparisonChartData();
  WeekComparisonGroupChartDataEntity weekGroup = WeekComparisonGroupChartData();
}