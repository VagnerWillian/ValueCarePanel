import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

class GetAllHistory implements GetAllHistoryUseCase{

  final HistoryRepository _historyRepository;
  GetAllHistory(this._historyRepository);

  @override
  Future<Either<HistoryError, List<HistoryItemEntity>>> call({required String idPatient})async{
    return await _historyRepository.getAllHistoryItems(idPatient: idPatient);
  }
}