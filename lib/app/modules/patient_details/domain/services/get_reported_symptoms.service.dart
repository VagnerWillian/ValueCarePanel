import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_reported_symptoms_of_patient_from_date.usecase.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

class GetReportedSymptomsOfPatientFromDate implements GetReportedSymptomsOfPatientFromDateUseCase{

  final PatientDetailsRepository _patientDetailsRepository;

  GetReportedSymptomsOfPatientFromDate(this._patientDetailsRepository);

  @override
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> call({required DateTime startDate, required DateTime endDate})async{
    return await _patientDetailsRepository.getReportedSymptomsOfPatient(startDate: startDate, endDate: endDate);
  }
}