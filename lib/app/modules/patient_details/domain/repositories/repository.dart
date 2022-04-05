import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';

import '../../errors/patient_details.errors.dart';
import '../entities/basic_value_data_chart.entity.dart';

abstract class PatientDetailsRepository{
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate});
  Future<Either<PatientDetailsError, PatientEntity>> getPatientDetails();
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> getReportedSymptomsOfPatient({required DateTime startDate, required DateTime endDate});
}