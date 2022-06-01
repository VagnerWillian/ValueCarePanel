import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

abstract class DeleteHistoryUseCase{
  Future<Either<HistoryError, bool>> call({required String idHistoryItem});
}