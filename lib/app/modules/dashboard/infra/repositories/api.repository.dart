import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

class ApiDashBoardRepository implements DashboardRepository{

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement getAllComparisonGroupChartData
    throw UnimplementedError();
  }

  @override
  Future<Either<DashboardError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement fetchMonitoringFromIntervalDates
    throw UnimplementedError();
  }

  @override
  Future<Either<DashboardError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) {
    // TODO: implement updateMonitoringItem
    throw UnimplementedError();
  }

  @override
  Future<Either<DashboardError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement generateReportDoc
    throw UnimplementedError();
  }

}