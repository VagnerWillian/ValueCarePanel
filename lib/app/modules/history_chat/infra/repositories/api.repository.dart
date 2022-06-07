import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/modules/history_chat/infra/models/history_item.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

class ApiHistoryRepository implements HistoryRepository{

  final CustomDio _customDio;
  ApiHistoryRepository(this._customDio);

  @override
  Future<Either<HistoryError, List<HistoryItemEntity>>> getAllHistoryItems({required String idUserPatient, required String idPatient}) async {
    try{
      var response = await _customDio.client.get(getPatientDetailsInfoEP + "$idUserPatient/paciente/$idPatient/historico?code=$azureCode");
      List<HistoryItemEntity> historyItems = (response.data['result'] as List).map((i) => HistoryItem.fromJson(i)).toList();
      return Right(historyItems);
    }on DioError catch(e){
      return Left(HistoryRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HistoryRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<HistoryError, HistoryItemEntity>> sendHistory({required String idUserPatient, required String idPatient, required Map<String, dynamic> data}) async {
    try{
      var response = await _customDio.client.post(getPatientDetailsInfoEP + "$idUserPatient/paciente/$idPatient/historico?code=$azureCode", data: data);
      HistoryItemEntity historyItemEntity = HistoryItem.fromJson(response.data['result']);
      return Right(historyItemEntity);
    }on DioError catch(e){
      return Left(HistoryRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HistoryRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<HistoryError, bool>> deleteHistory({required String idUserPatient, required String idPatient, required String idHistoryItem}) async{
    try{
      await _customDio.client.delete(getPatientDetailsInfoEP + "$idUserPatient/paciente/$idPatient/historico/remove/$idHistoryItem?code=$azureCode");
      return const Right(true);
    }on DioError catch(e){
      return Left(HistoryRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HistoryRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<HistoryError, bool>> markReadHistory({required String idUserPatient, required String idPatient, required String idHistoryItem}) async{
    try{
      await _customDio.client.put(getPatientDetailsInfoEP + "$idUserPatient/paciente/$idPatient/historico/ler/$idHistoryItem?code=$azureCode");
      return const Right(true);
    }on DioError catch(e){
      return Left(HistoryRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HistoryRepositoryError(message: e.toString()));
    }
  }

}