import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_group_chart_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

abstract class DashboardRepository{
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate});
}