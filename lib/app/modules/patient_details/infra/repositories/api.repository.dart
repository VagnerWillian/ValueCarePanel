import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../shared/custom_dio/custom.dio.dart';
import '../../../../utils/utils.dart';
import '../../domain/entities/basic_value_data_chart.entity.dart';
import '../../domain/entities/patient.entity.dart';
import '../../domain/entities/reported_symptom_group.entity.dart';
import '../../domain/repositories/repository.dart';
import '../../errors/patient_details.errors.dart';
import '../models/basic_value_data_chart.model.dart';
import '../models/patient.model.dart';
import '../models/reported_symptom_group.model.dart';

class ApiPatientDetailsRepository implements PatientDetailsRepository{

  final CustomDio _customDio;
  ApiPatientDetailsRepository(this._customDio);

  final _header = {"Authorization":"Bearer lib361fjoaiy06cib24z0fub3531yhpzxv214iro"};
  final _apiHeader = {"Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InJvZHJpZ29AdmFsdWVjYXJlLmNvbS5iciIsImlkIjoidGRGbXJUdEFGdUpOY1VpZ0RtSTUiLCJyb2xlIjoiYWRtaW4ifQ.egHPUWLXrfLhoQ5sZIW12AkKIGBfEWg_V6Tm8YOSVFw"};

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
    // try{
      // var response = await _customDio.client.get(getPatientDetailsInfo+idUserPatient+"/paciente/"+idPatient+"/perfil?code=$azureCode", options: Options(headers: _apiHeader));
      var response = await _customDio.client.get(getPatientDetailsInfoEP+"6Dx7dtIHPEYeVcGuBwVp9FBQyYX2"+"/paciente/"+"zaxOATwkVGx6QZabswmF"+"/perfil?code=$azureCode", options: Options(headers: _apiHeader));
      PatientEntity values = Patient.fromJson(response.data['result']);
      return Right(values);
    // }on DioError catch(e){
    //   return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    // }catch(e){
    //   return Left(PatientDetailsRepositoryError(message: e.toString()));
    // }
  }

  @override
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> getReportedSymptomsOfPatient({required DateTime startDate, required DateTime endDate, required String idUserPatient, required String idPatient}) async{
    // try{
      Map<String, dynamic> data = {
        "dataInicial":startDate.toString(),
        "dataFinal":endDate.toString()
      };
      // var response = await _customDio.client.get(getPatientDetailsInfo+idUserPatient+"/paciente/"+idPatient+"/perfil?code=$azureCode", options: Options(headers: _apiHeader));
      var response = await _customDio.client.post(getPatientDetailsInfoEP+"6Dx7dtIHPEYeVcGuBwVp9FBQyYX2"+"/paciente/"+"zaxOATwkVGx6QZabswmF"+"/sintomas-reportados?code=$azureCode", options: Options(headers: _apiHeader), data: data);
      ReportedSymptomGroupEntity values = ReportedSymptomGroup.fromJson(response.data);
      return Right(values);
    // }on DioError catch(e){
    //   return Left(PatientDetailsRepositoryError(statusCode: e.response?.statusCode));
    // }catch(e){
    //   return Left(PatientDetailsRepositoryError(message: e.toString()));
    // }
  }

}