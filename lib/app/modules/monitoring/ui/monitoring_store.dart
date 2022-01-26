import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_employees_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/ui/models/date_selector.model.dart';

part 'monitoring_store.g.dart';

class MonitoringStore = _MonitoringStoreBase with _$MonitoringStore;
abstract class _MonitoringStoreBase with Store {

  // Usecases
  final FetchMonitoringDataFromIntervalDatesUseCase fetchMonitoringDataFromIntervalDatesUseCase;
  final FetchReportDocSrcUseCase fetchReportDocSrcUseCase;
  final DownloadArchiveUseCase downloadArchiveUseCase;

  _MonitoringStoreBase({
    required this.fetchMonitoringDataFromIntervalDatesUseCase,
    required this.fetchReportDocSrcUseCase,
    required this.downloadArchiveUseCase
  }){
    addAllMonitoringItems([]);
  }

  // GETS
  int get rowsPerPage => monitoringDataItems.length<10?monitoringDataItems.length:10;
  double get pageCount => (monitoringDataItems.length | rowsPerPage)<=0 ? 1: (monitoringDataItems.length / rowsPerPage).ceilToDouble();

  //OTHERS
  List<MonitoringDataEntity> backupList = [];


  // OBSERVABLES

  @observable
  DateSelector? dateSelector;

  @observable
  bool loadingMonitoringItems = false;

  @observable
  ObservableList<MonitoringDataEntity> monitoringDataItems = ObservableList<MonitoringDataEntity>();

  // ACTIONS
  @action
  void setDateSelector(DateSelector value)=>dateSelector=value;

  @action
  void setLoadingMonitoringItems(bool value) {
    loadingMonitoringItems=value;
  }

  @action
  void addAllMonitoringItems(List<MonitoringDataEntity> items){
    monitoringDataItems.clear();
    monitoringDataItems.addAll(items);
  }


  // FUNCTIONS AND VOIDS
  Future onChangedSelectorDate(DateSelector dateSelector) async {
    setDateSelector(dateSelector);
    addAllMonitoringItems([]);
    setLoadingMonitoringItems(true);
    Either<MonitoringError, List<MonitoringDataEntity>> response = await fetchMonitoringDataFromIntervalDatesUseCase(
      startDate: dateSelector.startDate!,
      endDate: dateSelector.endDate!
    );
    response.fold((MonitoringError failure) {
      if(failure is MonitoringRepositoryError){
        print("Message error: ${failure.message}");
        print("Code error: ${failure.statusCode}");
      }
      return failure;
    }, (List<MonitoringDataEntity> data) {
      addAllMonitoringItems(data);
      backupList = data;
      return data;
    });
    setLoadingMonitoringItems(false);
  }

  /////////////////////////// SEARCH ///////////////////////////////////////////////////
    onChangedSearchText(String text){
    if(text.isNotEmpty) {
      List<MonitoringDataEntity> searchList = monitoringDataItems.where((m) {
        String? id = m.id.toString().toLowerCase();
        String? name = m.paciente?.toLowerCase();
        return name!.contains(text.toLowerCase())||id.contains(text.toLowerCase());
      }).toList();
      if(searchList.isNotEmpty){
        addAllMonitoringItems(searchList);
      }else{
        addAllMonitoringItems(backupList);
      }
    }else{
      addAllMonitoringItems(backupList);
    }
  }









  ////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////// EXPORTAR RELATORIO ///////////////////////////////////////
  bool get enableGenerateReportDoc => !loadingMonitoringItems&&dateSelector!=null;
  void downloadReportDocFromSrc({required String url}) {
    try{
      downloadArchiveUseCase(url: url);
    }catch(e){
      // TODO IMPLEMENTAR TRATAMENTO DE FALHA DOWNLOAD
    }
  }

  Future exportReportDoc()async{
    Either<MonitoringError, String> responseSrcOfDoc = await fetchReportDocSrcUseCase(
      startDate: dateSelector!.startDate!,
      endDate: dateSelector!.endDate!
    );
    responseSrcOfDoc.fold((MonitoringError failure) {
      // TODO IMPLEMENTAR TRATAMENTO DE FALHA
      return failure;
    }, (String url) {
      downloadReportDocFromSrc(url: url);
    });
  }

}