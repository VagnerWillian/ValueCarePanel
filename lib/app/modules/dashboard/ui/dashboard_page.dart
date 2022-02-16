import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';
import 'package:value_panel/app/modules/dashboard/ui/models/date_selector.model.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/new_cases.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/new_users.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/reported_symptoms.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/schedules_in_week.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/simple.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/widgets/cards/v_chart.card.dart';
import 'package:value_panel/app/shared/components/custom/gradient.button.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/components/page_title_description.widget.dart';
import 'package:value_panel/app/shared/utils.dart';

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
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _headerBuild(),
          Observer(builder: (_) {
            ComparisonGroupChartDataEntity _cGroup = store.comparisonGroupChartData;
            return store.loading
                ? SizedBox(
                    width: 250,
                    height: 250,
                    child: FlareActor(
                      'assets/anims/loading.flr',
                      animation: 'loading',
                      color: primaryColor,
                    ),
                  )
                : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    MasonryGridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      crossAxisCount: MediaQuery.of(context).size.width <= 880
                          ? 1
                          : MediaQuery.of(context).size.width <= 1410
                              ? 2
                              : 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return SizedBox(
                              height: (.7 % 5 + 1) * 100,
                              child: SimpleCard(
                                  label: "Pacientes Ativos", value: _cGroup.activeUsers.value, comparation: _cGroup.activeUsers.comparison),
                            );
                          case 1:
                            return SizedBox(
                              height: (.7 % 5 + 1) * 100,
                              child: SimpleCard(
                                  label: "Sintomas Reportados",
                                  value: _cGroup.reportedSymptons.value,
                                  comparation: _cGroup.reportedSymptons.comparison),
                            );
                          case 2:
                            return SizedBox(
                              height: (.7 % 5 + 1) * 100,
                              child: VChart(
                                label: "Consultas",
                                value: _cGroup.appointments.value,
                                comparation: _cGroup.appointments.comparison,
                                description: "(Período anterior)",
                              ),
                            );
                          case 3:
                            return SizedBox(
                              height: (.7 % 5 + 1) * 100,
                              child: ProgressCard(
                                label: "Novos Usuários",
                                value: _cGroup.newUsers.value,
                                comparation: _cGroup.newUsers.comparison,
                              ),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width<1355?4:2,
                          mainAxisCellCount: MediaQuery.of(context).size.width<1355?2:1,
                          child: NewCasesCard(
                            icon: LineAwesomeIcons.bell,
                            value: _cGroup.newCases.value,
                            description: "Novos casos urgentes para classificar e agendar",
                            textContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width<1355?2:1,
                          mainAxisCellCount: MediaQuery.of(context).size.width<1355?3:2,
                          child: SymptomReportedCard(reportedSymptomsGroup: _cGroup.reportedSymptonsComparison),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width<1355?2:1,
                          mainAxisCellCount: MediaQuery.of(context).size.width<1355?3:2,
                          child: const SimpleCard(label: "Pacientes Ativos", value: 421, comparation: "+0,5%"),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width<1355?4:2,
                          mainAxisCellCount: MediaQuery.of(context).size.width<1355?2:1,
                          child: LineChartVertical(
                            weekGroup: _cGroup.weekGroup,
                            description: "Consultas agendadas na última semana do período",
                          ),
                        ),
                      ],
                    )
                  ]);
          }),
        ]),
      ),
    );
  }

  Widget _headerBuild() => Row(
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
                          builder: (_) => DropdownButton<DateSelector>(
                            underline: Container(),
                            borderRadius: BorderRadius.circular(10),
                            value: store.dateSelector,
                            hint: const Text("..."),
                            focusColor: Colors.transparent,
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
                      ),
                    ],
                  )),
              Observer(
                builder: (_) => GradientButton(
                  height: 50,
                  onPressed: () {},
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
        store.preDates.replaceRange(store.preDates.length - 1, store.preDates.length, [
          DateSelector(
              label: "Selecionar outro período...",
              startDate: dateRange.startDate ?? dateRange.endDate,
              endDate: dateRange.endDate ?? dateRange.startDate,
              dynamic: true)
        ]);
        store.onChangedSelectorDate(store.preDates.last, onError);
      }
    } else {
      store.preDates.replaceRange(store.preDates.length - 1, store.preDates.length,
          [DateSelector(label: "Selecionar período...", startDate: null, endDate: null, dynamic: true)]);
      store.onChangedSelectorDate(v, onError);
    }
  }

  Future onError(DashboardError failure) async {
    if (failure is DashboardRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is DashboardUnknownError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => AnotherErrorDialog(unknownError: failure));
    }
  }
}
