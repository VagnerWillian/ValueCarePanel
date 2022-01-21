import 'dart:html';

import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

abstract class MonitoringRepository{
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchEmployeesFromIntervalDates({required DateTime startDate, required DateTime endDate});
  Future<Either<MonitoringError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate});
}