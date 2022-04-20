import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/monitoring_data.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

class ApiDashboardRepository implements DashboardRepository{

  final CustomDio _customDio;
  ApiDashboardRepository(this._customDio);

  @override
  Future<Either<DashboardError, ComparisonGroupChartDataEntity>> getAllComparisonGroupChartData({required DateTime startDate, required DateTime endDate}) async{
    // try{
      Map<String, dynamic> data = {
        "dataInicial":startDate.toString(),
        "dataFinal":endDate.toString()
      };
      var response = await _customDio.client.post(getDashboardEP, data: data);
      GroupsChart comparisonGroupChartData = GroupsChart.fromJson(response.data['result']);
      return Right(comparisonGroupChartData);
    // }on DioError catch(e){
    //   return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    // }catch(e){
    //   return Left(DashboardRepositoryError(message: e.toString()));
    // }
  }

  @override
  Future<Either<DashboardError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    try{
     /* Map<String, dynamic> data = {
        "dataInicial":startDate,
        "dataFinal":endDate
      };
      var response = await _customDio.client.patch(getDashboardEP, data: data);
      List<MonitoringDataEntity> monitoringDataItems = (response.data as List).map((i) => MonitoringData.fromJson(i)).toList();*/
      return const Right([]);
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
      var response = await _customDio.client.get("https://api.json-generator.com/templates/CewGX2FjpiVb/data");
      return Right(response.data['url']);
    }on DioError catch(e){
      return Left(DashboardRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(DashboardRepositoryError(message: e.toString()));
    }
  }
}