import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../shared/custom_dio/custom.dio.dart';
import '../../../../utils/utils.dart';
import '../../domain/entities/patient.entity.dart';
import '../../domain/entities/reported_symptom_group.entity.dart';
import '../../domain/repositories/repository.dart';
import '../../errors/patient_details.errors.dart';
import '../models/patient.model.dart';
import '../models/reported_symptom_group.model.dart';

class ApiPatientDetailsRepository implements PatientDetailsRepository{

  final CustomDio _customDio;
  ApiPatientDetailsRepository(this._customDio);

  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};

  /*@override
  Future<Either<PatientDetailsError, List<BasicValueChartDataEntity>>> getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate}) async {
    try{
      var response = await _customDio.client.post(
          "/usuario/vOcPGuzVblblm6yix9bwTveeWtk2/paciente/zjeEGMvoq0d3YzFGq1yO/grafico?code=$azureCode",
          options: Options(headers: _apiHeader),
          data: {
            "data":startDate.toString()
          }
      );
      List<BasicValueChartDataEntity> values = (response.data['result'] as List).map((json) => BasicValueChartData.fromJson(json)).toList();
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
      var response = await _customDio.client.get(getPatientDetailsInfoEP+idUserPatient+"/paciente/"+idPatient+"/perfil?code=$azureCode");
      PatientEntity values = Patient.fromJson(response.data['result']);
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
      Map<String, dynamic> data = {
        "dataInicial":startDate.toString(),
        "dataFinal":endDate.toString()
      };
      var response = await _customDio.client.post(getPatientDetailsInfoEP+idUserPatient+"/paciente/"+idPatient+"/sintomas-reportados?code=$azureCode&dataInicial=${patternDdMmmyyyy.format(startDate)}&dataFinal=${patternDdMmmyyyy.format(endDate)}", data: data);
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
    try{
      Map<String, dynamic> data = {
        "origem":newOrigin
      };
      print("alterando origem para $newOrigin");
      var response = await _customDio.client.post(getPatientDetailsInfoEP, data: data);
      return const Right(true);
    }on DioError catch(e){
      return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    }catch(e){
      return Left(PatientDetailsRepositoryError(message: e.toString()));
    }
  }

}