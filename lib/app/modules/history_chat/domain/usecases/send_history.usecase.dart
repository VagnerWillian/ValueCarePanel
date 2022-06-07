import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

abstract class SendHistoryUseCase{
  Future<Either<HistoryError, HistoryItemEntity>> call({required String idUserPatient, required String idPatient, required Map<String, dynamic> data});
}