import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/monitoring/ui/models/date_selector.model.dart';

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
    selectedDate = preDates.first;
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
              Text(d.startDate == null ? "Nenhuma data selecionada" : d.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.start),
            ],
          ),
          value: d,
        );
      }).toList(),
      onChanged: (v)=>onChangedDate(v),
    );
  }

  Future<void> onChangedDate(DateSelector? v) async {
    {
           if (v!.dynamic) {
             PickerDateRange? dateRange = await showDialog(
                barrierColor: Colors.white70,
                 context: context,
                 builder: (_) => Dialog(
                       child: SizedBox(
                         width: 300,
                         height: 300,
                         child: SfDateRangePicker(
                           showActionButtons: true,
                           initialDisplayDate: DateTime.now(),
                           selectionMode: DateRangePickerSelectionMode.extendableRange,
                           confirmText: "Confirmar",
                           cancelText: "Cancelar",
                           onSubmit: (value) => Modular.to.pop(value),
                           onCancel: () => Modular.to.pop(),
                         ),
                       ),
                     ));

             if (dateRange == null) {
               setSelectedDate(selectedDate = preDates.first);
             } else {
               preDates.replaceRange(preDates.length - 1, preDates.length, [DateSelector(label: "Selecionar outro período...", startDate: dateRange.startDate, endDate: dateRange.endDate, dynamic: true)]);
               setSelectedDate(selectedDate = preDates.last);
             }
           } else {
              setSelectedDate(selectedDate = v);
           }
         }
  }

  void setSelectedDate(DateSelector dateSelector){
    widget.onChangedSelectorDate(dateSelector);
    setState(() {
      selectedDate = dateSelector;
    });
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
