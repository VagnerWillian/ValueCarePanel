import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/delete_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

class DeleteHistory implements DeleteHistoryUseCase{

  final HistoryRepository _historyRepository;
  DeleteHistory(this._historyRepository);

  @override
  Future<Either<HistoryError, bool>> call({required int idHistoryItem})async{
    return await _historyRepository.deleteHistory(idHistoryItem: idHistoryItem);
  }
}