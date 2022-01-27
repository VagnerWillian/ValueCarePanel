import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

abstract class UpdateMonitoringItemUseCase{
  Future<Either<MonitoringError, bool>> call({required MonitoringDataEntity monitoringDataEntity});
}