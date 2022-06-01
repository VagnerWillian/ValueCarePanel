import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/modules/history_chat/infra/models/history_item.model.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class ApiHistoryRepository implements HistoryRepository{

  final CustomDio _customDio;
  ApiHistoryRepository(this._customDio);

  @override
  Future<Either<HistoryError, List<HistoryItemEntity>>> getAllHistoryItems({required String idPatient}) async {
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/pFY0RJfVv9iG/data");
      List<HistoryItemEntity> historyItems = (response.data as List).map((i) => HistoryItem.fromJson(i)).toList();
      return Right(historyItems);
    }on DioError catch(e){
      return Left(HistoryRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(HistoryRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<HistoryError, bool>> deleteHistory({required String idHistoryItem}) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

  @override
  Future<Either<HistoryError, bool>> markReadHistory({required String idHistoryItem}) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

}