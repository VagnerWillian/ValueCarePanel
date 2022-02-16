import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

class ApiDashBoardRepository implements DashboardRepository{

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement getAllComparisonGroupChartData
    throw UnimplementedError();
  }

}