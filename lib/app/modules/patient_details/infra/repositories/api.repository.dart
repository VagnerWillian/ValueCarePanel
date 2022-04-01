import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/basic_value_data_chart.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

class ApiPatientDetailsRepository implements PatientDetailsRepository{

  @override
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate}) {
    throw UnimplementedError();
  }

}