import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_group_chart_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/week_group_comparison_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/comparison_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/week_group_comparison_chart.model.dart';

class ComparisonGroupChartData implements ComparisonGroupChartDataEntity{

  @override
  ComparisonChartDataEntity activeUsers = ComparisonChartData();

  @override
  ComparisonChartDataEntity appointments = ComparisonChartData();

  @override
  ComparisonChartDataEntity newCases = ComparisonChartData();

  @override
  ComparisonChartDataEntity newUsers = ComparisonChartData();

  @override
  ComparisonChartDataEntity reportedSymptons = ComparisonChartData();

  @override
  WeekComparisonGroupChartDataEntity weekGroup = WeekComparisonGroupChartData();

  ComparisonGroupChartData();

  ComparisonGroupChartData.fromJson(Map<String, dynamic> json){
    activeUsers = ComparisonChartData.fromJson(json['pacientes_ativos']);
    reportedSymptons = ComparisonChartData.fromJson(json['sintomas_reportados']);
    appointments = ComparisonChartData.fromJson(json['consultas_periodo']);
    newUsers = ComparisonChartData.fromJson(json['novos_usuarios']);
    newCases = ComparisonChartData.fromJson(json['novos_casos_pendentes']);
    weekGroup = WeekComparisonGroupChartData.fromJson(json['agendadas_ultima_semana_periodo']);
  }

}