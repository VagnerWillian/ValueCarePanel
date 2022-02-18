import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

abstract class FetchMonitoringDataFromIntervalDatesUseCase{
  Future<Either<DashboardError, List<MonitoringDataEntity>>> call({required DateTime startDate, required DateTime endDate});
}