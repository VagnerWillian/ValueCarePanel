
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/monitoring_data.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

class ApiMonitoringRepository implements MonitoringRepository{

  final CustomDio _customDio;
  ApiMonitoringRepository(this._customDio);

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchMonitoringFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    try{
      var response = await _customDio.client.get(getMonitoringEP);
      List<MonitoringDataEntity> monitoringDataItems = (response.data['result'] as List).map((i) => MonitoringData.fromJson(i)).toList();
      return Right(monitoringDataItems);
    }on DioError catch(e){
      return Left(MonitoringRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<MonitoringError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/CewGX2FjpiVb/data");
      return Right(response.data['url']);
    }on DioError catch(e){
      return Left(MonitoringRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<MonitoringError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) async{
    try{
      await Future.delayed(const Duration(seconds: 2));
      // var response = await _customDio.client.post("https://api.json-generator.com/templates/-Yly0aK_l3oM/data");
      return const Right(true);
    }on DioError catch(e){
      return Left(MonitoringRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString()));
    }
  }

}