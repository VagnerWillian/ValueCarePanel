import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class JsonGeneratorDashboardRepository implements DashboardRepository{

  final CustomDio _customDio;
  JsonGeneratorDashboardRepository(this._customDio);

  final _header = {"Authorization":"Bearer kf62xpo2f9fwi8c2vtmoqfpxwfvs3okngz58pgam"};

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/sLP-7k5P4189/data", options: Options(headers: _header));
      GroupsChart comparisonGroupChartData = GroupsChart.fromJson(response.data);
      return Right(comparisonGroupChartData);
    }on DioError catch(e){
      return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(DashboardRepositoryError(message: e.toString()));
    }
  }

}