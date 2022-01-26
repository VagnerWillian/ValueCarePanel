
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/monitoring_data.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class JsonGeneratorRepository implements MonitoringRepository{

  CustomDio _customDio;
  JsonGeneratorRepository(this._customDio);

  final _header = {"Authorization":"Bearer ldhkns7svaq3wfb1faf6r4dfsa1bd8hua71d6lm6"};

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchEmployeesFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/w0LRENrD059V/data", options: Options(headers: _header));
      List<MonitoringDataEntity> monitoringDataItems = (response.data as List).map((i) => MonitoringData.fromJson(i)).toList();
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
      var response = await _customDio.client.get("https://api.json-generator.com/templates/-Yly0aK_l3oM/data", options: Options(headers: _header));
      return Right(response.data['url']);
    }on DioError catch(e){
      return Left(MonitoringRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(MonitoringRepositoryError(message: e.toString()));
    }
  }

}