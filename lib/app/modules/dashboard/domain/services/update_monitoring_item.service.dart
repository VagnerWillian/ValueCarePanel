import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';


class UpdateMonitoringItem implements UpdateMonitoringItemUseCase{

  late final DashboardRepository dasboardRepository;

  UpdateMonitoringItem({required this.dasboardRepository});

  @override
  Future<Either<DashboardError, bool>> call({required MonitoringDataEntity monitoringDataEntity})async{
    return await dasboardRepository.updateMonitoringItem(monitoringDataEntity: monitoringDataEntity);
  }
}