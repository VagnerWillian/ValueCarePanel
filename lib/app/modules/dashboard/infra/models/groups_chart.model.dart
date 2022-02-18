import 'package:value_panel/app/modules/dashboard/domain/entities/chart/basic_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/basic_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_value_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/week_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_group_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_value_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/symptoms_group_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/week_group_chart.model.dart';

class GroupsChart implements ComparisonGroupChartDataEntity{

  @override
  BasicValueChartDataEntity activeUsers = BasicValueChartData();

  @override
  BasicValueChartDataEntity appointments = BasicValueChartData();

  @override
  BasicValueChartDataEntity newCases = BasicValueChartData();

  @override
  BasicValueChartDataEntity newUsers = BasicValueChartData();

  @override
  BasicValueChartDataEntity reportedSymptons = BasicValueChartData();

  @override
  WeekGroupChartDataEntity weekGroup = WeekGroupChartData<BasicValueChartData>();

  @override
  SymptomsGroupChartDataEntity reportedSymptonsComparison = SymptomsGroupChartData<SymptomValueChartDataEntity>();

  @override
  BasicGroupChartDataEntity classifications = BasicGroupChartData();

  GroupsChart();

  GroupsChart.fromJson(Map<String, dynamic> json){
    activeUsers = BasicValueChartData.fromJson(json['pacientes_ativos']);
    reportedSymptons = BasicValueChartData.fromJson(json['sintomas_reportados']);
    reportedSymptonsComparison = SymptomsGroupChartData.fromJson(json['sintomas_reportados_lista']);
    appointments = BasicValueChartData.fromJson(json['consultas_periodo']);
    newUsers = BasicValueChartData.fromJson(json['novos_usuarios']);
    newCases = BasicValueChartData.fromJson(json['novos_casos_pendentes']);
    weekGroup = WeekGroupChartData.fromJson(json['agendadas_ultima_semana_periodo']);
    classifications = BasicGroupChartData.fromJson(json['classificacoes']);
  }

}