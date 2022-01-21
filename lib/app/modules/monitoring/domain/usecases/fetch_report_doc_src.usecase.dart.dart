import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';

abstract class FetchReportDocSrcUseCase{
  Future<Either<MonitoringError, String>> call({required DateTime startDate, required DateTime endDate});
}