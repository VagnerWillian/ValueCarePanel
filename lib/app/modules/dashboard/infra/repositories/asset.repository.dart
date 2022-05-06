import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/monitoring_data.model.dart';

class AssetDashBoardRepository implements DashboardRepository{

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/dashboard_today.json');
    var jsonResult = json.decode(data);
    GroupsChart comparisonGroupChartData = GroupsChart.fromJson(jsonResult['result']);
    return Right(comparisonGroupChartData);
  }

  @override
  Future<Either<DashboardError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/monitoring_today.json');
    var jsonResult = json.decode(data);
    List<MonitoringDataEntity> monitoringDataItems = (jsonResult as List).map((i) => MonitoringData.fromJson(i)).toList();
    return Right(monitoringDataItems);
  }

  @override
  Future<Either<DashboardError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

  @override
  Future<Either<DashboardError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/report_doc.json');
    var jsonResult = json.decode(data);
    return Right(jsonResult['src']);
  }

}