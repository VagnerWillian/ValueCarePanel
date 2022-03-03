import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

class FetchMonitoringFromIntervalDates implements FetchMonitoringDataFromIntervalDatesUseCase{

  final MonitoringRepository monitoringRepository;

  FetchMonitoringFromIntervalDates({required this.monitoringRepository});

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> call({required DateTime startDate, required DateTime endDate})async{
    return await monitoringRepository.fetchMonitoringFromIntervalDates(startDate: startDate, endDate: endDate);
  }
}