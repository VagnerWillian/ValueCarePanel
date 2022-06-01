import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_group.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/patient.model.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/reported_symptom_group.model.dart';

class AssetPatientDetailsRepository implements PatientDetailsRepository{

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
    await Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString('assets/static_jsons/patient_details.json');
    var jsonResult = json.decode(data);
    return Right(Patient.fromJson(jsonResult['result']));
  }

  @override
  Future<Either<PatientDetailsError, ReportedSymptomGroupEntity>> getReportedSymptomsOfPatient({required DateTime startDate, required DateTime endDate, required String idUserPatient, required String idPatient}) async{
    await Future.delayed(const Duration(seconds: 1));
    String data = await rootBundle.loadString('assets/static_jsons/patient_details_reported_symptoms.json');
    var jsonResult = json.decode(data);
    ReportedSymptomGroupEntity values = ReportedSymptomGroup.fromJson(jsonResult);
    return Right(values);
  }

  @override
  Future<Either<PatientDetailsError, bool>> saveOriginOfUser(String newOrigin) async{
    await Future.delayed(const Duration(seconds: 1));
    return const Right(true);
  }

}