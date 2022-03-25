import 'package:either_dart/either.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/download_archive.usecase.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_report_doc_src.usecase.dart.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/fetch_scheduling_items_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/scheduling/domain/usecases/update_scheduling_item.usecase.dart';
import 'package:value_panel/app/modules/scheduling/errors/scheduling.errors.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/scheduling.datasource.dart';

import '../../../shared/core/infra/models/date_selector.model.dart';

part 'scheduling_store.g.dart';

class SchedulingStore = _SchedulingStoreBase with _$SchedulingStore;
abstract class _SchedulingStoreBase with Store {

  // Usecases
  final FetchSchedulingDataFromIntervalDatesUseCase fetchSchedulingDataFromIntervalDatesUseCase;
  final FetchReportDocSrcUseCase fetchReportDocSrcUseCase;
  final DownloadArchiveUseCase downloadArchiveUseCase;
  final UpdateSchedulingItemUseCase updateSchedulingItemUseCase;

  _SchedulingStoreBase({
    required this.fetchSchedulingDataFromIntervalDatesUseCase,
    required this.fetchReportDocSrcUseCase,
    required this.downloadArchiveUseCase,
    required this.updateSchedulingItemUseCase
  }) {
    schedulingDataSource = SchedulingDataSource(updateSchedulingItem: updateSchedulingItem);
    preDatesLogic();
  }

  //OTHERS
  List<SchedulingDataEntity> backupList = [];
  final DataPagerController dataPagerController = DataPagerController();
  late SchedulingDataSource schedulingDataSource;

  // OBSERVABLES

  @observable
  DateSelector? dateSelector;

  @observable
  bool loadingSchedulingItems = false;

  @observable
  bool loadingUpdateSchedulingItem = false;

  @observable
  ObservableList<DateSelector> preDates = ObservableList<DateSelector>();

  // ACTIONS
  @action
  void setDateSelector(DateSelector value) => dateSelector = value;

  @action
  void setLoadingSchedulingItems(bool value) {
    loadingSchedulingItems = value;
  }

  @action
  void setLoadingUpdateSchedulingItem(bool value) {
    loadingUpdateSchedulingItem = value;
  }

  @action
  addPreDates(DateSelector value) => preDates.add(value);

  // FUNCTIONS AND/OR VOIDS
  Future onChangedSelectorDate(DateSelector dateSelector, Function onError) async {
    setDateSelector(dateSelector);
    setLoadingSchedulingItems(true);
    Either<SchedulingError, List<SchedulingDataEntity>> response = await fetchSchedulingDataFromIntervalDatesUseCase(
        startDate: dateSelector.startDate!,
        endDate: dateSelector.endDate!
    );
    response.fold((SchedulingError failure) {
      onError(failure);
      backupList.clear();
      schedulingDataSource.updateList([]);
      return failure;
    }, (List<SchedulingDataEntity> data) {
      backupList = data;
      schedulingDataSource.updateList(data);
      return data;
    });
    setLoadingSchedulingItems(false);
  }

  Future updateSchedulingItem(SchedulingDataEntity schedulingDataEntity, Function onError) async {
    setLoadingUpdateSchedulingItem(true);
    Either<SchedulingError, bool> response = await updateSchedulingItemUseCase(schedulingDataEntity: schedulingDataEntity);
    response.fold((SchedulingError failure) {
      onError(failure);
      return failure;
    }, (bool data) {
      return data;
    });
    setLoadingUpdateSchedulingItem(false);
    return response;
  }

  /////////////////////////// SEARCH ///////////////////////////////////////////////////
  onChangedSearchText(String text) async {
    setLoadingSchedulingItems(true);
    if (text.isNotEmpty) {
      List<SchedulingDataEntity> searchList = backupList.where((m) {
        String? id = m.idString.toLowerCase();
        String? name = m.patient.toLowerCase();
        return name.contains(text.toLowerCase()) || id.contains(text.toLowerCase());
      }).toList();
      schedulingDataSource.updateList(searchList);
    } else {
      schedulingDataSource.updateList(backupList);
    }
    setLoadingSchedulingItems(false);
    dataPagerController.firstPage();
  }

  ////////////////////////// EXPORTAR RELATORIO ///////////////////////////////////////
  void downloadReportDocFromSrc({required String url}) {
    try {
      downloadArchiveUseCase(url: url);
    } catch (e) {
      // TODO IMPLEMENTAR TRATAMENTO DE FALHA DOWNLOAD
    }
  }

  Future<Either<SchedulingError, String>> exportReportDoc(Function onError) async {
    Either<SchedulingError, String> responseSrcOfDoc = await fetchReportDocSrcUseCase(
        startDate: dateSelector!.startDate!,
        endDate: dateSelector!.endDate!
    );
    await responseSrcOfDoc.fold((SchedulingError failure) async {
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
    final DateTime startWeek = Jiffy(today)
        .startOf(Units.WEEK)
        .dateTime;

    // This Month
    final DateTime startMonthNow = Jiffy(today)
        .startOf(Units.MONTH)
        .dateTime;

    // Previous Month
    final DateTime startPreviousMonth = Jiffy(startMonthNow)
        .subtract(months: 1)
        .dateTime;
    final DateTime endPreviousMonth = Jiffy(startPreviousMonth)
        .endOf(Units.MONTH)
        .dateTime;

    final DateSelector todaySelector = DateSelector(label: "Hoje", startDate: today, endDate: today);
    final DateSelector thisWeekSelector = DateSelector(label: "Esta semana", startDate: startWeek, endDate: today);
    final DateSelector thisMonthSelector = DateSelector(label: "Este Mês", startDate: startMonthNow, endDate: today);
    final DateSelector previousMonthSelector = DateSelector(label: "Mês Anterior", startDate: startPreviousMonth, endDate: endPreviousMonth);
    final DateSelector anotherDate = DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true);

    final List<DateSelector> dates = [todaySelector, thisWeekSelector, thisMonthSelector, previousMonthSelector, anotherDate];
    dates.map((v) => addPreDates(v)).toList();
  }
}