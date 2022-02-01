import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';

abstract class SchedulingRepository{
  Future<Either<SchedulingError, List<SchedulingDataEntity>>> fetchSchedulingItemsFromIntervalDates({required DateTime startDate, required DateTime endDate});
  Future<Either<SchedulingError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate});
  Future<Either<SchedulingError, bool>> updateSchedulingItem({required SchedulingDataEntity schedulingDataEntity});
}