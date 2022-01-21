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
  });

  @observable
  DateSelector? dateSelector;

  @observable
  bool loadingMonitoringItems = false;

  @observable
  ObservableList<MonitoringDataEntity> monitoringDataItems = ObservableList<MonitoringDataEntity>();

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

  Future onChangedSelectorDate(DateSelector dateSelector) async {
    setDateSelector(dateSelector);
    addAllMonitoringItems([]);
    setLoadingMonitoringItems(true);
    Either<MonitoringError, List<MonitoringDataEntity>> response = await fetchMonitoringDataFromIntervalDatesUseCase(
      startDate: dateSelector.startDate,
      endDate: dateSelector.endDate
    );
    response.fold((MonitoringError failure) {
      return failure;
    }, (List<MonitoringDataEntity> data) {
      addAllMonitoringItems(data);
      return data;
    });
    setLoadingMonitoringItems(false);
  }

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
      startDate: dateSelector!.startDate,
      endDate: dateSelector!.endDate
    );
    responseSrcOfDoc.fold((MonitoringError failure) {
      // TODO IMPLEMENTAR TRATAMENTO DE FALHA
      return failure;
    }, (String url) {
      downloadReportDocFromSrc(url: url);
    });
  }
  //////////////////////////////////////////////////////////////////////////////////////

  // Pre Dates Logic
  List<DateSelector> get preDates {
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

    final List<DateSelector> dates = [
      todaySelector,
      thisWeekSelector,
      thisMonthSelector,
      previousMonthSelector
    ];

    return dates;
  }
}