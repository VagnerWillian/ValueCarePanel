
import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/monitoring_data.model.dart';

class AssetMonitoringRepository implements MonitoringRepository {

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/monitoring_today.json');
    var jsonResult = json.decode(data);
    List<MonitoringDataEntity> monitoringDataItems = (jsonResult as List).map((i) => MonitoringData.fromJson(i)).toList();
    return Right(monitoringDataItems);
  }

  @override
  Future<Either<MonitoringError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/report_doc.json');
    var jsonResult = json.decode(data);
    return Right(jsonResult['src']);
  }

  @override
  Future<Either<MonitoringError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }
}