import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/basic_value_data_chart.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

class ApiPatientDetailsRepository implements PatientDetailsRepository{

  @override
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<PatientDetailsError, PatientEntity>> getPatientDetails() {
    // TODO: implement getPatientDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> getReportedSymptomsOfPatient({required DateTime startDate, required DateTime endDate}) {
    // TODO: implement getReportedSymptomsOfPatient
    throw UnimplementedError();
  }

}