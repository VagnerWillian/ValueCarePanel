import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/fetch_monitoring_from_interval_dates.usecase.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/update_monitoring_item.usecase.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/monitoring.datasource.dart';
import 'package:value_panel/app/modules/dashboard/ui/models/date_selector.model.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/shared/utils.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;
abstract class _DashboardStoreBase with Store {

  final GetComparisonGroupDataUseCase _getComparisonGroupDataUseCase;
  final FetchMonitoringDataFromIntervalDatesUseCase _fetchMonitoringDataFromIntervalDatesUseCase;
  final UpdateMonitoringItemUseCase _updateMonitoringItemUseCase;
  final HomeStore homeStore = Modular.get();

  //OTHERS
  final DataPagerController dataPagerController = DataPagerController();
  late MonitoringDataSource monitoringDataSource;

  _DashboardStoreBase(this._getComparisonGroupDataUseCase, this._fetchMonitoringDataFromIntervalDatesUseCase, this._updateMonitoringItemUseCase){
    monitoringDataSource = MonitoringDataSource(updateMonitoringItem: updateMonitoringItem);
    preDatesLogic();
  }

  // OSERVABLES

  @observable
  bool loadingAnalytics = false;

  @observable
  bool loadingMonitoringItems = false;

  @observable
  bool loadingUpdateMonitoringItems = false;

  @observable
  DateSelector? dateSelector;

  @observable
  ObservableList<DateSelector> preDates = ObservableList<DateSelector>();

  @observable
  ComparisonGroupChartDataEntity comparisonGroupChartData = GroupsChart();

  // ACTIONS
  @action
  void setLoadingAnalytics(bool value) => loadingAnalytics=value;

  @action
  void setLoadingMonitoring(bool value) => loadingMonitoringItems=value;

  @action
  void setLoadingUpdateMonitoring(bool value) => loadingUpdateMonitoringItems=value;

  @action
  void setDateSelector(DateSelector value)=>dateSelector=value;

  @action
  addPreDates(DateSelector value)=>preDates.add(value);

  @action
  setComparisonChartGroup(ComparisonGroupChartDataEntity value)=>comparisonGroupChartData=value;

  // FUNCTIONS AND VOIDS

  Future onChangedSelectorDate(DateSelector dateSelector, Function onError) async {
    setDateSelector(dateSelector);
    loadAnalyticsDataFromSelectorDate(dateSelector, onError);
    loadMonitoringItemsFromSelectorDate(dateSelector, onError);
  }

  void loadAnalyticsDataFromSelectorDate(DateSelector dateSelector, Function onError)async {
    setLoadingAnalytics(true);
    Either<DashboardError, ComparisonGroupChartDataEntity> response = await _getComparisonGroupDataUseCase(startDate: dateSelector.startDate!, endDate: dateSelector.endDate!);
    response.fold((DashboardError failure) {
      onError(failure);
      return failure;
    }, (ComparisonGroupChartDataEntity value) {
      setComparisonChartGroup(value);
      return value;
    });
    setLoadingAnalytics(false);
  }

    void loadMonitoringItemsFromSelectorDate(DateSelector dateSelector, Function onError)async{
    setLoadingMonitoring(true);
    Either<DashboardError, List<MonitoringDataEntity>> response = await _fetchMonitoringDataFromIntervalDatesUseCase(startDate: dateSelector.startDate!, endDate: dateSelector.endDate!);
    response.fold((DashboardError failure) {
      onError(failure);
      monitoringDataSource.updateList([]);
      return failure;
    }, (List<MonitoringDataEntity> values) {
      monitoringDataSource.updateList(values);
      return values;
    });
    setLoadingMonitoring(false);
  }

  Future<Either<DashboardError, bool>> updateMonitoringItem(MonitoringDataEntity monitoringDataEntity, Function onError) async {
    setLoadingUpdateMonitoring(true);
    Either<DashboardError, bool> response = await _updateMonitoringItemUseCase(monitoringDataEntity: monitoringDataEntity);
    response.fold((DashboardError failure) {
      onError(failure);
      return failure;
    }, (bool data) {
      return data;
    });
    setLoadingUpdateMonitoring(false);
    return response;
  }

  void goMonitoring()=>homeStore.navigateTo(MONITORING_ROUTE);
  void goScheduling()=>homeStore.navigateTo(SCHEDULING_ROUTE);
  void goAnalytics()=>homeStore.navigateTo(ANALYTICS_ROUTE);

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