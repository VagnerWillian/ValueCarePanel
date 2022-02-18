import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

abstract class FetchMonitoringDataFromIntervalDatesUseCase{
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> call({required DateTime startDate, required DateTime endDate});
}