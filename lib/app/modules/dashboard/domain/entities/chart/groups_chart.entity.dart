import 'package:value_panel/app/modules/dashboard/domain/entities/chart/basic_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/week_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_group_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_value_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/symptoms_group_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/week_group_chart.model.dart';

import 'basic_group_chart.entity.dart';

abstract class ComparisonGroupChartDataEntity{
  BasicValueChartDataEntity activeUsers = BasicValueChartData();
  BasicValueChartDataEntity reportedSymptoms = BasicValueChartData();
  BasicValueChartDataEntity appointments = BasicValueChartData();
  BasicValueChartDataEntity newUsers = BasicValueChartData();
  BasicValueChartDataEntity newCases = BasicValueChartData();
  BasicGroupChartDataEntity classifications = BasicGroupChartData();
  WeekGroupChartDataEntity weekGroup = WeekGroupChartData();
  SymptomsGroupChartDataEntity reportedSymptomsComparison = SymptomsGroupChartData<SymptomValueChartDataEntity>();
}