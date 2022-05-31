import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/mark_read_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

class MarkedReadService implements MarkedReadUseCase{

  final HistoryRepository _historyRepository;
  MarkedReadService(this._historyRepository);

  @override
  Future<Either<HistoryError, bool>> call({required int idHistoryItem})async{
    return await _historyRepository.markReadHistory(idHistoryItem: idHistoryItem);
  }
}