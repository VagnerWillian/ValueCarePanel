import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/scheduling/ui/models/date_selector.model.dart';
import 'package:value_panel/app/shared/utils.dart';

class SelectorDateWidget extends StatefulWidget {
  final Function onChangedSelectorDate;
  const SelectorDateWidget({Key? key, required this.onChangedSelectorDate}) : super(key: key);

  @override
  _SelectorDateWidgetState createState() => _SelectorDateWidgetState();
}

class _SelectorDateWidgetState extends State<SelectorDateWidget> {
  late List<DateSelector> preDates;
  DateSelector? selectedDate;

  @override
  void initState() {
    preDates = preDatesLogic();
    setSelectedDate(preDates.first);
    onChangedDate(preDates.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DateSelector>(
      underline: Container(),
      borderRadius: BorderRadius.circular(10),
      value: selectedDate!,
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
              d.startDate == null ? Container():Text(d.startDate == null ? "Nenhuma data selecionada" : d.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.start),
            ],
          ),
          value: d,
        );
      }).toList(),
      onChanged: (v) => onChangedDate(v),
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
                            textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold,),
                            todayTextStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold,),
                        ),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold),
                            todayTextStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold,),
                        ),
                        selectionTextStyle: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold),
                        headerStyle: DateRangePickerHeaderStyle(
                          textStyle: GoogleFonts.cairo(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30)
                        ),
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
          preDates.replaceRange(preDates.length - 1, preDates.length,
              [DateSelector(label: "Selecionar outro período...", startDate: dateRange.startDate??dateRange.endDate, endDate: dateRange.endDate??dateRange.startDate, dynamic: true)]);
          setSelectedDate(preDates.last);
        }
      } else {
        preDates.replaceRange(preDates.length - 1, preDates.length, [DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true)]);
        setSelectedDate(v);
      }
  }

  void setSelectedDate(DateSelector dateSelector) {
    setState(() {
      selectedDate = dateSelector;
    });
    widget.onChangedSelectorDate(dateSelector);
  }

  List<DateSelector> preDatesLogic() {
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

    return dates;
  }
}
