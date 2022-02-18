import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
abstract class FetchReportDocSrcUseCase{
  Future<Either<DashboardError, String>> call({required DateTime startDate, required DateTime endDate});
}