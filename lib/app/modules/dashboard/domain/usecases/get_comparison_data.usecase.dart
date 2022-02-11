import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/comparison_group_chart_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

abstract class GetComparisonGroupDataUseCase{
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> call({required DateTime startDate, required DateTime endDate});
}