import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

abstract class MarkedReadUseCase{
  Future<Either<HistoryError, bool>> call({required String idUserPatient, required String idPatient, required String idHistoryItem});
}