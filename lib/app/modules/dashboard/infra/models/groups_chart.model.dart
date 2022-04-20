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
  BasicValueChartDataEntity reportedSymptoms = BasicValueChartData();

  @override
  WeekGroupChartDataEntity weekGroup = WeekGroupChartData<BasicValueChartData>();

  @override
  SymptomsGroupChartDataEntity reportedSymptomsComparison = SymptomsGroupChartData<SymptomValueChartDataEntity>();

  @override
  BasicGroupChartDataEntity classifications = BasicGroupChartData();

  GroupsChart();

  GroupsChart.fromJson(Map<String, dynamic> json){
    activeUsers = BasicValueChartData.fromJson(json['pacientesAtivos']);
    reportedSymptoms = BasicValueChartData.fromJson(json['sintomasReportados']);
    reportedSymptomsComparison = SymptomsGroupChartData.fromJson(json['sintomasReportadosLista']);
    appointments = BasicValueChartData.fromJson(json['consultasPeriodo']);
    newUsers = BasicValueChartData.fromJson(json['novosUsuarios']);
    newCases = BasicValueChartData.fromJson(json['novosCasosPendentes']);
    weekGroup = WeekGroupChartData.fromJson(json['agendadasUltimaSemanaPeriodo']);
    classifications = BasicGroupChartData.fromJson(json);
  }

}