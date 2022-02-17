import 'package:either_dart/either.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/domain/usecases/get_comparison_data.usecase.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/groups_chart.model.dart';
import 'package:value_panel/app/modules/dashboard/ui/models/date_selector.model.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/shared/utils.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;
abstract class _DashboardStoreBase with Store {

  final GetComparisonGroupDataUseCase _getComparisonGroupDataUseCase;
  final HomeStore homeStore = Modular.get();

  _DashboardStoreBase(this._getComparisonGroupDataUseCase){
    preDatesLogic();
  }

  // OSERVABLES

  @observable
  bool loading = false;

  @observable
  DateSelector? dateSelector;

  @observable
  ObservableList<DateSelector> preDates = ObservableList<DateSelector>();

  @observable
  ComparisonGroupChartDataEntity comparisonGroupChartData = GroupsChart();

  // ACTIONS
  @action
  void setLoading(bool value) => loading=value;

  @action
  void setDateSelector(DateSelector value)=>dateSelector=value;

  @action
  addPreDates(DateSelector value)=>preDates.add(value);

  @action
  setComparisonChartGroup(ComparisonGroupChartDataEntity value)=>comparisonGroupChartData=value;

  // FUNCTIONS AND VOIDS

  Future onChangedSelectorDate(DateSelector dateSelector, Function onError) async {
    setDateSelector(dateSelector);
    setLoading(true);
    Either<DashboardError, ComparisonGroupChartDataEntity> response = await _getComparisonGroupDataUseCase(startDate: dateSelector.startDate!, endDate: dateSelector.endDate!);
    response.fold((DashboardError failure) {
      onError(failure);
      return failure;
    }, (ComparisonGroupChartDataEntity value) {
      setComparisonChartGroup(value);
      return value;
    });
    setLoading(false);
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