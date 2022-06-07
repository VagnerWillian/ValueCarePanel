import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/mark_read_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

class MarkedRead implements MarkedReadUseCase{

  final HistoryRepository _historyRepository;
  MarkedRead(this._historyRepository);

  @override
  Future<Either<HistoryError, bool>> call({required String idUserPatient, required String idPatient, required String idHistoryItem})async{
    return await _historyRepository.markReadHistory(idUserPatient: idUserPatient, idPatient: idPatient, idHistoryItem: idHistoryItem);
  }
}