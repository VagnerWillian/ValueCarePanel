import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/monitoring_data.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class JsonGeneratorDashboardRepository implements DashboardRepository{

  final CustomDio _customDio;
  JsonGeneratorDashboardRepository(this._customDio);

  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};

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

  @override
  Future<Either<DashboardError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/JU04s1dTWKtl/data", options: Options(headers: _header));
      List<MonitoringDataEntity> monitoringDataItems = (response.data as List).map((i) => MonitoringData.fromJson(i)).toList();
      return Right(monitoringDataItems);
    }on DioError catch(e){
      return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(DashboardRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<DashboardError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // var response = await _customDio.client.post("https://api.json-generator.com/templates/-Yly0aK_l3oM/data", options: Options(headers: _header));
      return const Right(true);
    } on DioError catch (e) {
      return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    } catch (e) {
      return Left(DashboardRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<DashboardError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/CewGX2FjpiVb/data", options: Options(headers: _header));
      return Right(response.data['url']);
    }on DioError catch(e){
      return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(DashboardRepositoryError(message: e.toString()));
    }
  }
}