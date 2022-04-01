import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/patient_details/errors/patient_details.errors.dart';

import '../../../../../shared/components/charts/models/chart.config.dart';
import '../../../../../shared/components/charts/models/chart.data.item.dart';
import '../../../../../shared/components/charts/models/double_line.chart.dart';
import '../../../../../shared/core/infra/models/date_selector.model.dart';
import '../../../../../utils/utils.dart';
import '../../../domain/entities/basic_value_data_chart.entity.dart';

class ScoreChartSession extends StatefulWidget {
  final List<BasicValueChartDataEntity> values;
  final Function(PatientDetailsError failure) onError;
  final Function({required DateTime startDate, required DateTime endDate, required Function(PatientDetailsError failure) onError}) getScoreGraphicOfDates;
  const ScoreChartSession({required this.onError, required this.getScoreGraphicOfDates, required this.values, Key? key}) : super(key: key);

  @override
  State<ScoreChartSession> createState() => _ScoreChartSessionState();
}

class _ScoreChartSessionState extends State<ScoreChartSession> {

  final List<DateSelector> preDates = [];
  final List<ChartDataItem> chartData = [];
  late DateSelector selectedDate;
  bool loading = false;

  @override
  void initState() {
    preDatesLogic();
    selectedDate = preDates.first;
    onChangedDate(preDates.first);
    super.initState();
  }

  void setDateSelector(DateSelector dateSelector) {
    setState(() => selectedDate = dateSelector);
    getScoreGraphicOfDates();
  }

  Future getScoreGraphicOfDates()async{
    setState(() => loading = true);
    await widget.getScoreGraphicOfDates(startDate: selectedDate.startDate!, endDate: selectedDate.endDate!, onError: widget.onError);
    chartData.clear();
    widget.values.map((e) => chartData.add(ChartDataItem(e.label, e.value, secondValue: e.secondValue))).toList();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 0), // changes position of shadow
          )
        ],
      ),
      child: loading ? Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: FlareActor(
            'assets/anims/loading.flr',
            animation: 'loading',
            color: primaryColor,
          ),
        ),
      )
          : Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  makeTransactionsIcon(),
                  const SizedBox(
                    width: 38,
                  ),
                  Text(
                    'Grafico',
                    style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'score',
                    style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 80,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(
                        LineAwesomeIcons.calendar,
                        color: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<DateSelector>(
                          underline: Container(),
                          borderRadius: BorderRadius.circular(10),
                          value: selectedDate,
                          hint: const Text("..."),
                          focusColor: Colors.transparent,
                          items: preDates.map((d) {
                            return DropdownMenuItem<DateSelector>(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    d.label,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    textAlign: TextAlign.start,
                                  ),
                                  d.startDate == null
                                      ? Container()
                                      : Text(d.startDate == null ? "Nenhuma data selecionada" : d.description,
                                      style: const TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.start),
                                ],
                              ),
                              value: d,
                            );
                          }).toList(),
                          onChanged: (v) => onChangedDate(v),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
           Container(
             margin: const EdgeInsets.only(top: 15),
             child: DoubleLineChart(
                chartDataConfig: ChartDataConfig(group: chartData)),
           )
        ],
      ),
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.black,
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.black,
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.black,
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.black,
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.black,
        ),
      ],
    );
  }

  Future<void> onChangedDate(DateSelector? v) async {
    if (v!.dynamic) {
      PickerDateRange? dateRange = await showDialog(
          barrierColor: Colors.white70,
          context: context,
          builder: (_) => Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 450,
                    height: 450,
                    child: SfDateRangePicker(
                      rangeSelectionColor: secondColor.withOpacity(0.3),
                      selectionColor: secondColor,
                      endRangeSelectionColor: primaryColor,
                      startRangeSelectionColor: primaryColor,
                      todayHighlightColor: primaryColor,
                      rangeTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                      yearCellStyle: DateRangePickerYearCellStyle(
                        textStyle: GoogleFonts.cairo(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        todayTextStyle: GoogleFonts.cairo(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold),
                        todayTextStyle: GoogleFonts.cairo(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selectionTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                      headerStyle:
                          DateRangePickerHeaderStyle(textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30)),
                      showActionButtons: true,
                      selectionMode: DateRangePickerSelectionMode.extendableRange,
                      confirmText: "Confirmar",
                      cancelText: "Cancelar",
                      onSubmit: (value) => Modular.to.pop(value),
                      onCancel: () => Modular.to.pop(),
                    ),
                  ),
                ),
              ));

      if (dateRange != null) {
        preDates.replaceRange(preDates.length - 1, preDates.length, [
          DateSelector(
              label: "Selecionar outro período...",
              startDate: dateRange.startDate ?? dateRange.endDate,
              endDate: dateRange.endDate ?? dateRange.startDate,
              dynamic: true)
        ]);
        setDateSelector(selectedDate = preDates.last);
      }
    } else {
      preDates.replaceRange(
          preDates.length - 1, preDates.length, [DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true)]);
      setDateSelector(selectedDate = v);
    }
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
    dates.map((v) => preDates.add(v)).toList();
  }
}
