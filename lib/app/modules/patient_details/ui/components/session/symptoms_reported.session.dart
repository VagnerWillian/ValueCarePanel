import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/patient_details/ui/components/tiles/reported_symptom.tile.dart';
import 'package:value_panel/app/shared/components/custom/dashed_divider.dart';
import 'package:value_panel/app/shared/core/infra/models/date_selector.model.dart';
import 'package:value_panel/app/utils/utils.dart';

class SymptomsReportedSession extends StatefulWidget {
  const SymptomsReportedSession({Key? key}) : super(key: key);

  @override
  State<SymptomsReportedSession> createState() => _SymptomsReportedSessionState();
}

class _SymptomsReportedSessionState extends State<SymptomsReportedSession> {
  List<DateSelector> preDates = [];
  late DateSelector dateSelector;

  @override
  void initState() {
    preDatesLogic();
    dateSelector = preDates.first;
    onChangedDate(preDates.first);
    super.initState();
  }

  void setDateSelector(DateSelector dateSelector) {
    setState(() => dateSelector = dateSelector);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.blueGrey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 80,
          offset: const Offset(0, 0), // changes position of shadow
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sintomas Reportados", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
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
                          value: dateSelector,
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
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: 'Hoje - ', style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
                    const TextSpan(
                      text: 'Score',
                    ),
                    TextSpan(text: ' 45', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: primaryColor)),
                  ],
                ),
              ),
              Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 20), child: const DashedDivider()))
            ],
          ),
          const ReportedSymptomTile(
            isNew: false,
            hasWarning: true,
            situationColor: "#6418C3",
            symptomName: "Febre",
            momentDate: "2min Atrás",
            srcImage: "assets/images/symptoms/1.svg",
            situation: "35,9ºC - Igual",
            description: "Não tinha antes do covid",
            descriptionDate: "Segunda, 27 de Setembro de 2021",
          ),
          const ReportedSymptomTile(
            isNew: true,
            hasWarning: false,
            situationColor: "#FF4A55",
            symptomName: "Queda de Cabelo",
            momentDate: "5h Atrás",
            srcImage: "assets/images/symptoms/2.svg",
            situation: "Piorando",
            description: "Não tinha antes do covid",
            descriptionDate: "Domingo, 27 de Setembro de 2021",
          ),
          const ReportedSymptomTile(
            isNew: false,
            hasWarning: false,
            situationColor: "#5ECFFF",
            symptomName: "Dificuldade de concentração, esquecimento e cabeça vazia",
            momentDate: "10h Atrás",
            srcImage: "assets/images/symptoms/3.svg",
            situation: "Melhorando",
            description: "Já tinha antes do covid",
            descriptionDate: "Domingo, 26 de Setembro de 2021",
          ),
          const ReportedSymptomTile(
            isNew: false,
            hasWarning: false,
            situationColor: "",
            symptomName: "Cançaço, Fadiga",
            momentDate: "23h Atrás",
            srcImage: "assets/images/symptoms/4.svg",
            situation: "Igual",
            description: "Não tinha antes do covid",
            descriptionDate: "Domingo, 25 de Setembro de 2021",
          ),
          const ReportedSymptomTile(
            isNew: false,
            hasWarning: false,
            situationColor: "#38E25D",
            symptomName: "Tosse",
            momentDate: "1d Atrás",
            srcImage: "assets/images/symptoms/5.svg",
            situation: "Não sinto mais nada",
            description: "Não tinha antes do covid",
            descriptionDate: "Domingo, 25 de Setembro de 2021",
          ),
        ],
      ),
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
        setDateSelector(dateSelector = preDates.last);
      }
    } else {
      preDates.replaceRange(
          preDates.length - 1, preDates.length, [DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true)]);
      setDateSelector(dateSelector = v);
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
