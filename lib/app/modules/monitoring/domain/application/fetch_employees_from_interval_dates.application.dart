import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_employees_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

class FetchEmployeesFromIntervalDates implements FetchMonitoringDataFromIntervalDatesUseCase{

  final MonitoringRepository monitoringRepository;

  FetchEmployeesFromIntervalDates({required this.monitoringRepository});

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> call({required DateTime startDate, required DateTime endDate}){
    return monitoringRepository.fetchEmployeesFromIntervalDates(startDate: startDate, endDate: endDate);
  }
}