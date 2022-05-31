import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/patient.model.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/reported_symptom_group.model.dart';

import '../../../../shared/custom_dio/custom.dio.dart';

class JsonGeneratorPatientDetailsRepository implements PatientDetailsRepository{

  final CustomDio _customDio;
  JsonGeneratorPatientDetailsRepository(this._customDio);

  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};

/*  @override
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate, }) async {
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/4LpiMFnYz7XX/data", options: Options(headers: _header));
      List<BasicValueChartDataEntity> values = (response.data as List).map((json) => BasicValueChartData.fromJson(json)).toList();
      return Right(values);
    }on DioError catch(e){
      return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(PatientDetailsRepositoryError(message: e.toString()));
    }
  }*/

  @override
  Future<Either<PatientDetailsError, PatientEntity>> getPatientDetails({required String idUserPatient, required String idPatient}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/tbYfiMYogpAs/data", options: Options(headers: _header));
      PatientEntity values = Patient.fromJson(response.data);
      return Right(values);
    }on DioError catch(e){
      return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(PatientDetailsRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> getReportedSymptomsOfPatient({required DateTime startDate, required DateTime endDate, required String idUserPatient, required String idPatient}) async{
    try{
      var response = await _customDio.client.get("https://api.json-generator.com/templates/1Ojq-0EEASAN/data", options: Options(headers: _header));
      ReportedSymptomGroupEntity values = ReportedSymptomGroup.fromJson(response.data);
      return Right(values);
    }on DioError catch(e){
      return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(PatientDetailsRepositoryError(message: e.toString()));
    }
  }

  @override
  Future<Either<PatientDetailsError, bool>> saveOriginOfUser(String newOrigin) async{
    print("alterando origem para $newOrigin");
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

}