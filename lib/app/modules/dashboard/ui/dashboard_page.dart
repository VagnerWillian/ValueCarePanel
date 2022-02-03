import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/dashboard/errors/monitoring.errors.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';
import 'package:value_panel/app/modules/dashboard/ui/models/date_selector.model.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/simple.card.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:value_panel/app/shared/widgets/custom/gradient.button.dart';
import 'package:value_panel/app/shared/widgets/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/widgets/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/widgets/page_title_description.widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  void initState() {
    store.setDateSelector(store.preDates.first);
    onChangedDate(store.preDates.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _headerBuild(),
          Wrap(
            direction: Axis.horizontal,
            children: [
              SimpleCard(label: "Pacientes Ativos", value: "421", comparation: "+0.5%"),
              SimpleCard(label: "Sintomas Reportados", value: "874", comparation: "-6.4%"),
              SimpleCard(label: "Consultas", value: "153", comparation: "-8.8%"),
              SimpleCard(label: "Novos Usuarios", value: "15", comparation: "+1.4%"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerBuild()=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const PageTitleDescription(title: "Bem vindo Vagner", subtitle: "Estamos felizes por tê-lo aqui."),
      Row(
        children: [
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
                    child: Observer(
                      builder:(_)=>DropdownButton<DateSelector>(
                        underline: Container(),
                        borderRadius: BorderRadius.circular(10),
                        value: store.dateSelector,
                        hint: const Text("..."),
                        items: store.preDates.map((d) {
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
                      ),
                    ),
                  ),
                ],
              )),
          Observer(
            builder: (_) => GradientButton(
              height: 50,
              onPressed: (){},
              gradient: LinearGradient(
                colors: store.loading ? [Colors.grey, Colors.grey] : gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  const Icon(
                    LineAwesomeIcons.pie_chart,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Gerar Relatório",
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ],
  );

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
        store.preDates.replaceRange(store.preDates.length - 1, store.preDates.length,
            [DateSelector(label: "Selecionar outro período...", startDate: dateRange.startDate??dateRange.endDate, endDate: dateRange.endDate??dateRange.startDate, dynamic: true)]);
        store.onChangedSelectorDate(store.preDates.last, onError);
      }
    } else {
      store.preDates.replaceRange(store.preDates.length - 1, store.preDates.length, [DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true)]);
      store.onChangedSelectorDate(v, onError);
    }
  }

  Future onError(DashboardError failure)async{
    if(failure is DashboardRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is DashboardUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>AnotherErrorDialog(unknownError: failure));
    }
  }
}