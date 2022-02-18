import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';

class GetComparisonGroupData implements GetComparisonGroupDataUseCase{

  final DashboardRepository _dashBoardRepository;
  GetComparisonGroupData(this._dashBoardRepository);

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> call({required DateTime startDate, required DateTime endDate}) async{
    return await _dashBoardRepository.getAllComparisonGroupChartData(startDate: startDate, endDate: endDate);
  }

}