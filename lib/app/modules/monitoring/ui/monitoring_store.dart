import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/monitoring/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/monitoring.datasource.dart';
import 'package:value_panel/app/shared/core/infra/models/date_selector.model.dart';

import 'package:value_panel/app/utils/utils.dart';


part 'monitoring_store.g.dart';

class MonitoringStore = _MonitoringStoreBase with _$MonitoringStore;
abstract class _MonitoringStoreBase with Store {

  // Usecases
  final FetchMonitoringDataFromIntervalDatesUseCase fetchMonitoringDataFromIntervalDatesUseCase;
  final FetchReportDocSrcUseCase fetchReportDocSrcUseCase;
  final DownloadArchiveUseCase downloadArchiveUseCase;
  final UpdateMonitoringItemUseCase updateMonitoringItemUseCase;

  // Stories
  late final HistoryChatStore historyChatStore;
  late final HomeStore homeStore;
  late final HistoryChatStore chatStore;
  _MonitoringStoreBase({
    required this.chatStore,
    required this.homeStore,
    required this.historyChatStore,
    required this.fetchMonitoringDataFromIntervalDatesUseCase,
    required this.fetchReportDocSrcUseCase,
    required this.downloadArchiveUseCase,
    required this.updateMonitoringItemUseCase
  }){
    monitoringDataSource = MonitoringDataSource(updateMonitoringItem: updateMonitoringItem, openHistoryFloating: openHistoryFloating, openPatientDetails: openPatientDetails);
    preDatesLogic();

  }

  //OTHERS
  List<MonitoringDataEntity> backupList = [];
  final DataPagerController dataPagerController = DataPagerController();
  late MonitoringDataSource monitoringDataSource;

  // OBSERVABLES

  @observable
  bool loadingMonitoringItems = false;

  @observable
  bool loadingUpdateMonitoringItem = false;

  @observable
  DateSelector? dateSelector;

  @observable
  ObservableList<DateSelector> preDates = ObservableList<DateSelector>();

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

  @action
  addPreDates(DateSelector value)=>preDates.add(value);

  // FUNCTIONS AND VOIDS
  Future onChangedSelectorDate(DateSelector dateSelector, Function onError) async {
    setDateSelector(dateSelector);
    setLoadingMonitoringItems(true);
    Either<MonitoringError, List<MonitoringDataEntity>> response = await fetchMonitoringDataFromIntervalDatesUseCase(
      startDate: dateSelector.startDate!,
      endDate: dateSelector.endDate!
    );
    response.fold((MonitoringError failure) {
      onError(failure);
      backupList.clear();
      monitoringDataSource.updateList([]);
      return failure;
    }, (List<MonitoringDataEntity> data) {
      backupList = data;
      monitoringDataSource.updateList(data);
      return data;
    });
    setLoadingMonitoringItems(false);
  }


  Future updateMonitoringItem(MonitoringDataEntity monitoringDataEntity, Function onError) async {
    setLoadingUpdateMonitoringItem(true);
    Either<MonitoringError, bool> response = await updateMonitoringItemUseCase(monitoringDataEntity: monitoringDataEntity);
    response.fold((MonitoringError failure) {
      onError(failure);
      return failure;
    }, (bool data) {
      return data;
    });
    setLoadingUpdateMonitoringItem(false);
    return response;
  }

  void openHistoryFloating() {
    historyChatStore.open(idPatient: "");
  }

  void openPatientDetails(String idPatient)async{
    Modular.to.pushNamed(PATIENT_DETAILS_ROUTE+idPatient);
  }

  /////////////////////////// SEARCH ///////////////////////////////////////////////////
    onChangedSearchText(String text)async{
      setLoadingMonitoringItems(true);
      if(text.isNotEmpty) {
        List<MonitoringDataEntity> searchList = backupList.where((m) {
        String? id = m.idString.toLowerCase();
        String? name = m.patient.toLowerCase();
        return name.contains(text.toLowerCase())||id.contains(text.toLowerCase());
      }).toList();
        monitoringDataSource.updateList(searchList);
      }else{
        monitoringDataSource.updateList(backupList);
      }
      setLoadingMonitoringItems(false);
      dataPagerController.firstPage();
    }

  ////////////////////////// EXPORTAR RELATORIO ///////////////////////////////////////
  void downloadReportDocFromSrc({required String url, on}) {
    try{
      downloadArchiveUseCase(url: url);
    }catch(e){
      // TODO IMPLEMENTAR TRATAMENTO DE FALHA DOWNLOAD
    }
  }

  Future<Either<MonitoringError, String>> exportReportDoc(Function onError)async{
    Either<MonitoringError, String> responseSrcOfDoc = await fetchReportDocSrcUseCase(
      startDate: dateSelector!.startDate!,
      endDate: dateSelector!.endDate!
    );
    await responseSrcOfDoc.fold((MonitoringError failure) async{
      await onError(failure);
      return failure;
    }, (String url) {
      downloadReportDocFromSrc(url: url);
    });
    return responseSrcOfDoc;
  }

  ///////////////////////////////////// PRE-DATES LOGIC //////////////////////////
  void preDatesLogic() {
    final DateTime today = DateTime.now();

    // This week
    final DateTime startWeek = Jiffy(today).startOf(Units.WEEK).dateTime;

    // This Month
    final DateTime startMonthNow = Jiffy(today).startOf(Units.MONTH).dateTime;

    // Previous Month
    final DateTime startPreviousMonth = Jiffy(startMonthNow).subtract(months: 1).dateTime;
    final DateTime endPreviousMonth = Jiffy(startPreviousMonth).endOf(Units.MONTH).dateTime;

    final DateSelector todaySelector = DateSelector(label: "Hoje", startDate: today, endDate: today);
    final DateSelector thisWeekSelector = DateSelector(label: "Esta semana", startDate: startWeek, endDate: today);
    final DateSelector thisMonthSelector = DateSelector(label: "Este Mês", startDate: startMonthNow, endDate: today);
    final DateSelector previousMonthSelector = DateSelector(label: "Mês Anterior", startDate: startPreviousMonth, endDate: endPreviousMonth);
    final DateSelector anotherDate = DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true);

    final List<DateSelector> dates = [todaySelector, thisWeekSelector, thisMonthSelector, previousMonthSelector, anotherDate];
    dates.map((v) => addPreDates(v)).toList();
  }

}