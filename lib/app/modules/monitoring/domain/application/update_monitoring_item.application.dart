import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

class UpdateMonitoringItem implements UpdateMonitoringItemUseCase{

  final MonitoringRepository _monitoringRepository;

  UpdateMonitoringItem(this._monitoringRepository);

  @override
  Future<Either<MonitoringError, bool>> call({required MonitoringDataEntity monitoringDataEntity})async{
    return await _monitoringRepository.updateMonitoringItem(monitoringDataEntity: monitoringDataEntity);
  }
}