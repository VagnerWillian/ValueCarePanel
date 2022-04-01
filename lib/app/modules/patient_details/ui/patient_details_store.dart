import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/basic_value_data_chart.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/usecases/get_score_graphic_of_dates.usecase.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

part 'patient_details_store.g.dart';

class PatientDetailsStore = _PatientDetailsStoreBase with _$PatientDetailsStore;
abstract class _PatientDetailsStoreBase with Store {

  final GetScoreGraphicOfDatesUseCase _getScoreGraphicOfDatesUseCase;

  _PatientDetailsStoreBase(this._getScoreGraphicOfDatesUseCase);

  //Observable

  @observable
  ObservableList<BasicValueChartDataEntity> scoreGraphicDataList = ObservableList<BasicValueChartDataEntity>();

  //Action
  addAllScoreGraphicData(List<BasicValueChartDataEntity> values){
    scoreGraphicDataList.clear();
    scoreGraphicDataList.addAll(values);
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

}