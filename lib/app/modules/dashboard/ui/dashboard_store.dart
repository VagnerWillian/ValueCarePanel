import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/dashboard/ui/models/date_selector.model.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;
abstract class _DashboardStoreBase with Store {

  _DashboardStoreBase(){
    preDatesLogic();
  }

  // OSERVABLES

  @observable
  bool loading = false;

  @observable
  DateSelector? dateSelector;

  @observable
  ObservableList<DateSelector> preDates = ObservableList<DateSelector>();

  // ACTIONS
  @action
  void setLoading(bool value) => loading=value;

  @action
  void setDateSelector(DateSelector value)=>dateSelector=value;

  @action
  addPreDates(DateSelector value)=>preDates.add(value);

  // FUNCTIONS AND VOIDS

  Future onChangedSelectorDate(DateSelector dateSelector, Function onError) async {
    setDateSelector(dateSelector);
    setLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    setLoading(false);
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