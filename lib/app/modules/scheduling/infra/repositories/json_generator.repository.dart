
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/modules/scheduling/infra/models/scheduling_data.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class JsonGeneratorRepository implements SchedulingRepository{

  final CustomDio _customDio;
  JsonGeneratorRepository(this._customDio);

  final _header = {"Authorization":"Bearer ldhkns7svaq3wfb1faf6r4dfsa1bd8hua71d6lm6"};

  @override
  Future<Either<SchedulingError, List<SchedulingDataEntity>>> fetchSchedulingItemsFromIntervalDates({required DateTime startDate, required DateTime endDate}) async {
    try{
     /* await Future.delayed(Duration(seconds: 2));
      String data = await rootBundle.loadString('assets/jsons_static/scheduling_today.json');
      var jsonResult = json.decode(data);
      List<SchedulingData> e = (jsonResult['result'] as List).map((e) => SchedulingData.fromJson(e)).toList();
      return Right(e);*/
      var response = await _customDio.client.get("https://api.json-generator.com/templates/4SAzQe1yEACA/data", options: Options(headers: _header));
      List<SchedulingDataEntity> schedulingDataItems = (response.data as List).map((i) => SchedulingData.fromJson(i)).toList();
      return Right(schedulingDataItems);
    }on DioError catch(e){
      return Left(SchedulingRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(SchedulingRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<SchedulingError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/-Yly0aK_l3oM/data", options: Options(headers: _header));
      return Right(response.data['url']);
    }on DioError catch(e){
      return Left(SchedulingRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(SchedulingRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<SchedulingError, bool>> updateSchedulingItem({required SchedulingDataEntity schedulingDataEntity}) async{
    try{
      await Future.delayed(const Duration(seconds: 2));
      // var response = await _customDio.client.post("https://api.json-generator.com/templates/-Yly0aK_l3oM/data", options: Options(headers: _header));
      return const Right(true);
    }on DioError catch(e){
      return Left(SchedulingRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(SchedulingRepositoryError(message: e.toString()));
    }
  }

}