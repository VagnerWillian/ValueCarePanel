import 'package:either_dart/either.dart';

import '../../errors/patient_details.errors.dart';
import '../entities/basic_value_data_chart.entity.dart';

abstract class GetScoreGraphicOfDatesUseCase{
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> call({required DateTime startDate, required DateTime endDate});
}