import 'package:either_dart/either.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_employees_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/monitoring.datasource.dart';
import 'package:value_panel/app/modules/monitoring/ui/models/date_selector.model.dart';

part 'monitoring_store.g.dart';

class MonitoringStore = _MonitoringStoreBase with _$MonitoringStore;
abstract class _MonitoringStoreBase with Store {

  // Usecases
  final FetchMonitoringDataFromIntervalDatesUseCase fetchMonitoringDataFromIntervalDatesUseCase;
  final FetchReportDocSrcUseCase fetchReportDocSrcUseCase;
  final DownloadArchiveUseCase downloadArchiveUseCase;
  final UpdateMonitoringItemUseCase updateMonitoringItemUseCase;

  _MonitoringStoreBase({
    required this.fetchMonitoringDataFromIntervalDatesUseCase,
    required this.fetchReportDocSrcUseCase,
    required this.downloadArchiveUseCase,
    required this.updateMonitoringItemUseCase
  }){
    monitoringDataSource = MonitoringDataSource(updateMonitoringItem: updateMonitoringItem);
  }

  //OTHERS
  List<MonitoringDataEntity> backupList = [];
  final DataPagerController dataPagerController = DataPagerController();
  late MonitoringDataSource monitoringDataSource;

  // OBSERVABLES

  @observable
  DateSelector? dateSelector;

  @observable
  bool loadingMonitoringItems = false;

  @observable
  bool loadingUpdateMonitoringItem = false;


  // ACTIONS
  @action
  void setDateSelector(DateSelector value)=>dateSelector=value;

  @action
  void setLoadingMonitoringItems(bool value) {
    loadingMonitoringItems=value;
  }

  @action
  void setLoadingUpdateMonitoringItem(bool value) {
    loadingUpdateMonitoringItem=value;
  }

  // FUNCTIONS AND VOIDS
  Future onChangedSelectorDate(DateSelector dateSelector) async {
    setDateSelector(dateSelector);
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
      backupList = data;
      monitoringDataSource.updateList(data);
      return data;
    });
    setLoadingMonitoringItems(false);
  }

  Future updateMonitoringItem(MonitoringDataEntity monitoringDataEntity) async {
    setLoadingUpdateMonitoringItem(true);
    Either<MonitoringError, bool> response = await updateMonitoringItemUseCase(monitoringDataEntity: monitoringDataEntity);
    response.fold((MonitoringError failure) {
      if(failure is MonitoringRepositoryError){
        print("Message error: ${failure.message}");
        print("Code error: ${failure.statusCode}");
      }
      return failure;
    }, (bool data) {
      return data;
    });
    setLoadingUpdateMonitoringItem(false);
    return response;
  }

  /////////////////////////// SEARCH ///////////////////////////////////////////////////
    onChangedSearchText(String text)async{
      setLoadingMonitoringItems(true);
      if(text.isNotEmpty) {
        List<MonitoringDataEntity> searchList = backupList.where((m) {
        String? id = m.idString.toLowerCase();
        String? name = m.patient?.toLowerCase();
        return name!.contains(text.toLowerCase())||id.contains(text.toLowerCase());
      }).toList();
        monitoringDataSource.updateList(searchList);
      }else{
        monitoringDataSource.updateList(backupList);
      }
      setLoadingMonitoringItems(false);
      dataPagerController.firstPage();
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

  Future<Either<MonitoringError, String>> exportReportDoc()async{
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
    return responseSrcOfDoc;
  }

}