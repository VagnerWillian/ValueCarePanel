import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

import '../usecases/send_history.usecase.dart';

class SendHistory implements SendHistoryUseCase{

  final HistoryRepository _historyRepository;
  SendHistory(this._historyRepository);

  @override
  Future<Either<HistoryError, HistoryItemEntity>> call({required String idUserPatient, required String idPatient, required Map<String, dynamic> data})async{
    return await _historyRepository.sendHistory(idUserPatient: idUserPatient, idPatient: idPatient, data: data);
  }
}