
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class APIRepository implements SchedulingRepository{

  CustomDio _customDio;
  APIRepository(this._customDio);

  @override
  Future<Either<SchedulingError, List<SchedulingDataEntity>>> fetchSchedulingItemsFromIntervalDates({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement fetchEmployeesFromIntervalDates
    throw UnimplementedError();
  }

  @override
  Future<Either<SchedulingError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement generateReportDoc
    throw UnimplementedError();
  }

  @override
  Future<Either<SchedulingError, bool>> updateSchedulingItem({required SchedulingDataEntity schedulingDataEntity}) {
    // TODO: implement updateMonitoringItem
    throw UnimplementedError();
  }


}