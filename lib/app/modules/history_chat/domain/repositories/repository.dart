import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

abstract class HistoryRepository {
  Future<Either<HistoryError, List<HistoryItemEntity>>> getAllHistoryItems({required String idPatient});
}