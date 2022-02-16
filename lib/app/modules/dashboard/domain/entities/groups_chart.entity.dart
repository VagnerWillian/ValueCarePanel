import 'package:value_panel/app/modules/dashboard/domain/entities/basic_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/symptoms_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/symptoms_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/week_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_value_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/symptoms_group_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/week_group_chart.model.dart';

abstract class ComparisonGroupChartDataEntity{
  BasicValueChartDataEntity activeUsers = BasicValueChartData();
  BasicValueChartDataEntity reportedSymptons = BasicValueChartData();
  BasicValueChartDataEntity appointments = BasicValueChartData();
  BasicValueChartDataEntity newUsers = BasicValueChartData();
  BasicValueChartDataEntity newCases = BasicValueChartData();
  WeekGroupChartDataEntity weekGroup = WeekGroupChartData();
  SymptomsGroupChartDataEntity reportedSymptonsComparison = SymptomsGroupChartData<SymptomValueChartDataEntity>();
}