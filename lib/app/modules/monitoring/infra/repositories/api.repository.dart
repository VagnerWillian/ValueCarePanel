
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

class APIRepository implements MonitoringRepository{

  CustomDio _customDio;
  APIRepository(this._customDio);

  @override
  Future<Either<MonitoringError, List<MonitoringDataEntity>>> fetchEmployeesFromIntervalDates({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement fetchEmployeesFromIntervalDates
    throw UnimplementedError();
  }

  @override
  Future<Either<MonitoringError, String>> generateReportDoc({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement generateReportDoc
    throw UnimplementedError();
  }

  @override
  Future<Either<MonitoringError, bool>> updateMonitoringItem({required MonitoringDataEntity monitoringDataEntity}) {
    // TODO: implement updateMonitoringItem
    throw UnimplementedError();
  }


}