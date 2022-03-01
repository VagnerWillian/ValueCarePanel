
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/modules/scheduling/infra/models/scheduling_data.model.dart';

class AssetSchedulingRepository implements SchedulingRepository{

  AssetSchedulingRepository();

  @override
  Future<Either<SchedulingError, List<SchedulingDataEntity>>> fetchSchedulingItemsFromIntervalDates({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/scheduling_today.json');
    var jsonResult = json.decode(data);
    List<SchedulingDataEntity> monitoringDataItems = (jsonResult as List).map((i) => SchedulingData.fromJson(i)).toList();
    return Right(monitoringDataItems);
  }

  @override
  Future<Either<SchedulingError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/report_doc.json');
    var jsonResult = json.decode(data);
    return Right(jsonResult['src']);
  }

  @override
  Future<Either<SchedulingError, bool>> updateSchedulingItem({required SchedulingDataEntity schedulingDataEntity}) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }


}