import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

abstract class DashboardRepository{
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate});
  Future<Either<DashboardError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate});
  Future<Either<DashboardError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity});
}