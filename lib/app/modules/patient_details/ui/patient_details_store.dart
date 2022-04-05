import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/basic_value_data_chart.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_patient_details.usecase.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_reported_symptoms_of_patient_from_date.usecase.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_score_graphic_of_dates.usecase.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

import '../domain/entities/reported_symptom_group.entity.dart';

part 'patient_details_store.g.dart';

class PatientDetailsStore = _PatientDetailsStoreBase with _$PatientDetailsStore;
abstract class _PatientDetailsStoreBase with Store {

  final GetScoreGraphicOfDatesUseCase _getScoreGraphicOfDatesUseCase;
  final GetReportedSymptomsOfPatientFromDateUseCase _getReportedSymptomsOfPatientFromDateUseCase;
  final GetPatientDetailsUseCase _getPatientDetailsUseCase;

  _PatientDetailsStoreBase(this._getScoreGraphicOfDatesUseCase, this._getPatientDetailsUseCase, this._getReportedSymptomsOfPatientFromDateUseCase);

  //Observable

  @observable
  ObservableList<BasicValueChartDataEntity> scoreGraphicDataList = ObservableList<BasicValueChartDataEntity>();

  @observable
  ReportedSymptomGroupEntity? reportedSymptomGroupEntity;

  @observable
  PatientEntity? patientDetails;

  //Action

  @action
  setPatientDetails(PatientEntity patient){
    patientDetails = patient;
  }

  @action
  setReportedSymptomGroup(ReportedSymptomGroupEntity value){
    reportedSymptomGroupEntity = value;
  }

  @action
  addAllScoreGraphicData(List<BasicValueChartDataEntity> values){
    scoreGraphicDataList.clear();
    scoreGraphicDataList.addAll(values);
  }

  //Voids

  Future getPatientInfoDetails({required Function onError})async{
    Either<PatientDetailsError, PatientEntity> result = await _getPatientDetailsUseCase();
    result.fold((PatientDetailsError failure) async{
      await onError(failure);
      return failure;
    }, (PatientEntity value) async{
      setPatientDetails(value);
      return value;
    });
  }

  Future getScoreGraphicOfDates({required DateTime startDate, required DateTime endDate, required Function onError})async{
    Either<PatientDetailsError, List<BasicValueChartDataEntity>> result = await _getScoreGraphicOfDatesUseCase(startDate: startDate, endDate: endDate);
    result.fold((PatientDetailsError failure) async{
      await onError(failure);
      return failure;
    }, (List<BasicValueChartDataEntity> values) async{
      addAllScoreGraphicData(values);
      return values;
    });
  }

  Future getReportedSymptomsOfPatientFromDate({required DateTime startDate, required DateTime endDate, required Function onError})async{
    Either<PatientDetailsError, ReportedSymptomGroupEntity> result = await _getReportedSymptomsOfPatientFromDateUseCase(startDate: startDate, endDate: endDate);
    result.fold((PatientDetailsError failure) async{
      await onError(failure);
      return failure;
    }, (ReportedSymptomGroupEntity value) async{
      setReportedSymptomGroup(value);
      return value;
    });
  }

}