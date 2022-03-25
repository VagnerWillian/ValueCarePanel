import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../shared/components/charts/models/chart.config.dart';
import '../../../../../shared/components/charts/models/chart.data.item.dart';
import '../../../../../shared/components/charts/models/double_line.chart.dart';
import '../../../../../shared/core/infra/models/date_selector.model.dart';
import '../../../../../utils/utils.dart';

class ScoreChartSession extends StatefulWidget {
  const ScoreChartSession({Key? key}) : super(key: key);

  @override
  State<ScoreChartSession> createState() => _ScoreChartSessionState();
}

class _ScoreChartSessionState extends State<ScoreChartSession> {
  List<DateSelector> preDates = [];
  late DateSelector selectedDate;

  @override
  void initState() {
    preDatesLogic();
    selectedDate = preDates.first;
    onChangedDate(preDates.first);
    super.initState();
  }

  void setDateSelector(DateSelector dateSelector) {
    setState(() => selectedDate = dateSelector);
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
      child: Column(
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
                chartDataConfig: ChartDataConfig(group: [
              ChartDataItem("01/10", 65, secondValue: 80),
              ChartDataItem("02/10", 40, secondValue: 35),
              ChartDataItem("03/10", 57, secondValue: 90),
              ChartDataItem("04/10", 59, secondValue: 90),
              ChartDataItem("05/10", 22, secondValue: 38),
              ChartDataItem("06/10", 65, secondValue: 19),
              ChartDataItem("07/10", 37, secondValue: 79),
              ChartDataItem("08/10", 12, secondValue: 40),
              ChartDataItem("09/10", 50, secondValue: 50),
              ChartDataItem("10/10", 24, secondValue: 85),
          ])),
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
