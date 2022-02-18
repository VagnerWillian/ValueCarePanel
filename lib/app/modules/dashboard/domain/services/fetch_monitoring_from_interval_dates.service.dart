import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

class FetchMonitoringFromIntervalDates implements FetchMonitoringDataFromIntervalDatesUseCase{

  final DashboardRepository dashBoardRepository;

  FetchMonitoringFromIntervalDates({required this.dashBoardRepository});

  @override
  Future<Either<DashboardError, List<MonitoringDataEntity>>> call({required DateTime startDate, required DateTime endDate})async{
    return await dashBoardRepository.fetchMonitoringFromIntervalDates(startDate: startDate, endDate: endDate);
  }
}