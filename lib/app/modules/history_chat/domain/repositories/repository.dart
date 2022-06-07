import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

abstract class HistoryRepository {
  Future<Either<HistoryError, List<HistoryItemEntity>>> getAllHistoryItems({required String idUserPatient, required String idPatient});
  Future<Either<HistoryError, HistoryItemEntity>> sendHistory({required String idUserPatient, required String idPatient, required Map<String, dynamic> data});
  Future<Either<HistoryError, bool>> markReadHistory({required String idUserPatient, required String idPatient, required String idHistoryItem});
  Future<Either<HistoryError, bool>> deleteHistory({required String idUserPatient, required String idPatient, required String idHistoryItem});
}