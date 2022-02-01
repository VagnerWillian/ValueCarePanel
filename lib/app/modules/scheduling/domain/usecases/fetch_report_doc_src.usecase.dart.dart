import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

abstract class FetchReportDocSrcUseCase{
  Future<Either<SchedulingError, String>> call({required DateTime startDate, required DateTime endDate});
}