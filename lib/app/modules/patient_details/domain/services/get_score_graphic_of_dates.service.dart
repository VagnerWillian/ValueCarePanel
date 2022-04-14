import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_score_graphic_of_dates.usecase.dart';

import '../../errors/patient_details.errors.dart';
import '../entities/basic_value_data_chart.entity.dart';

class GetScoreGraphicOfDates implements GetScoreGraphicOfDatesUseCase{

  final PatientDetailsRepository _patientDetailsRepository;
  GetScoreGraphicOfDates(this._patientDetailsRepository);

  @override
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> call({required DateTime startDate, required DateTime endDate}) async{
    throw UnimplementedError();
  }

}