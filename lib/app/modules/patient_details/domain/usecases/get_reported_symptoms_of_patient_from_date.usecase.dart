import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

abstract class GetReportedSymptomsOfPatientFromDateUseCase{
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> call({required DateTime startDate, required DateTime endDate, required String idUserPatient, required String idPatient});
}