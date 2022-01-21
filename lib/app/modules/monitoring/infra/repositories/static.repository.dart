import 'dart:convert';
import 'dart:html';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/monitoring_data.model.dart';

class StaticRepository implements MonitoringRepository{

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchEmployeesFromIntervalDates({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    try{
      String data = await rootBundle.loadString('assets/static_jsons/monitoring_today.json');
      var jsonResult = json.decode(data);
      List<MonitoringData> items = (jsonResult as List).map((e) => MonitoringData.fromJson(e)).toList();
      return Right(items);
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString(), statusCode: 0));
    }
  }

  @override
  Future<Either<MonitoringError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    try{
      String data = await rootBundle.loadString('assets/static_jsons/report_doc.json');
      var jsonResult = json.decode(data);
      return Right(jsonResult['src']);
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString(), statusCode: 0));
    }
  }
}