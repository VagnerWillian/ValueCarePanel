import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/chart/groups_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/errors/dashboard.errors.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/classifications.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/new_cases.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/new_users.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/reported_symptoms.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/schedules_in_week.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/simple.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/components/cards/simple_with_v_chart.card.dart';
import 'package:value_panel/app/modules/dashboard/ui/dashboard_store.dart';
import 'package:value_panel/app/shared/components/custom/gradient.button.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/loading.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/components/page_title_description.widget.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../shared/core/infra/models/date_selector.model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ModularState<DashboardPage, DashboardStore> {

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      store.preDatesLogic();
      store.setDateSelector(store.preDates.first);
      onChangedDate(store.preDates.first);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _headerAnalyticsBuild(),
          Observer(builder: (_) {
            ComparisonGroupChartDataEntity _cGroup = store.comparisonGroupChartData;
            return store.loadingAnalytics
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
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
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
                                  value: _cGroup.reportedSymptoms.value,
                                  comparation: _cGroup.reportedSymptoms.comparison),
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
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 4 : 2,
                          mainAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 2 : 1,
                          child: NewCasesCard(
                            icon: LineAwesomeIcons.bell,
                            value: _cGroup.newCases.value,
                            description: "Novos casos urgentes para classificar e agendar",
                            textContent:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore",
                            goMonitoring: store.goMonitoring,
                            goScheduling: store.goScheduling,
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 2 : 1,
                          mainAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 3 : 2,
                          child: SymptomReportedCard(reportedSymptomsGroup: _cGroup.reportedSymptomsComparison, goAnalytics: store.goAnalytics),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 2 : 1,
                          mainAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 3 : 2,
                          child: ClassificationsCard(basicGroupChartDataEntity: _cGroup.classifications),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 4 : 2,
                          mainAxisCellCount: MediaQuery.of(context).size.width < 1355 ? 2 : 1,
                          child: LineChartVertical(
                            weekGroup: _cGroup.weekGroup,
                            description: "Consultas agendadas na última semana do período",
                          ),
                        ),
                      ],
                    )
                  ]);
          }),
          const SizedBox(height: 20),
         /* Observer(
            builder: (_) => store.loadingMonitoringItems
                ? Center(
                    child: SizedBox(
                    width: 250,
                    height: 250,
                    child: FlareActor(
                      'assets/anims/loading.flr',
                      animation: 'loading',
                      color: primaryColor,
                    ),
                  ))
                : Column(
                    children: [
                      _headerMonitoringBuild(),
                      const SizedBox(height: 20),
                      Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 80,
                              offset: const Offset(0, 0), // changes position of shadow
                            ),
                          ], color: Colors.white, borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                          child: Column(children: [_buildDataGrid(), _buildGridPages()])),
                    ],
                  ),
          )*/
        ]),
      ),
    );
  }

  Widget _buildDataGrid() {
    const double _rowHeight = 65.0;
    return SfDataGrid(
      shrinkWrapRows: true,
      columnWidthMode: ColumnWidthMode.fill,
      gridLinesVisibility: GridLinesVisibility.none,
      headerGridLinesVisibility: GridLinesVisibility.horizontal,
      source: store.monitoringDataSource,
      rowHeight: _rowHeight,
      columns: store.monitoringDataSource.columnNames.map((e) {
        return GridColumn(
            minimumWidth: e.minWidth,
            maximumWidth: e.maxWidth,
            columnName: e.label,
            label: Container(
                alignment: Alignment.center,
                child: Text(
                  e.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
                )));
      }).toList(),
    );
  }

  Widget _buildGridPages() => SfDataPagerTheme(
        data: SfDataPagerThemeData(
            selectedItemColor: primaryColor,
            itemBorderRadius: BorderRadius.circular(5),
            selectedItemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
            itemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.w800, color: Colors.black)),
        child: IgnorePointer(
          ignoring: store.loadingUpdateMonitoringItems,
          child: SfDataPager(
            controller: store.dataPagerController,
            delegate: store.monitoringDataSource,
            pageCount: store.monitoringDataSource.pageCount,
            direction: Axis.horizontal,
            pageItemBuilder: (str) {
              if (str == "First") {
                return Icon(LineAwesomeIcons.step_backward, color: primaryColor, size: 18);
              } else if (str == "Last") {
                return Icon(LineAwesomeIcons.step_forward, color: primaryColor, size: 18);
              } else if (str == "Previous") {
                return Icon(LineAwesomeIcons.angle_left, color: primaryColor, size: 18);
              } else if (str == "Next") {
                return Icon(LineAwesomeIcons.angle_right, color: primaryColor, size: 18);
              }
            },
          ),
        ),
      );

  Widget _headerAnalyticsBuild() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PageTitleDescription(title: "Bem vindo", subtitle: "Estamos felizes por tê-lo aqui."),
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
                          builder: (_) {
                            return DropdownButton<DateSelector>(
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
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              /*Observer(
                  builder: (_) => GradientButton(
                    height: 50,
                    onPressed: ()=>store.exportReportDoc(onError),
                    gradient: LinearGradient(
                      colors: store.loadingAnalytics ? [Colors.grey, Colors.grey] : gradientColors,
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
                ),*/
            ],
          )
        ],
      ),
    );
  }

  Widget _headerMonitoringBuild() => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageTitleDescription(title: "Pacientes sem Agendamento e/ou Classificação"),
            Row(
              children: [
                GradientButton(
                  height: 50,
                  onPressed: ()=>store.goMonitoring(),
                  gradient: LinearGradient(
                    colors: gradientColors,
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
                        "Ver Classificações",
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                GradientButton(
                  height: 50,
                  onPressed: ()=>store.goScheduling(),
                  gradient: LinearGradient(
                    colors: gradientColors,
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
                        "Ver Agendamentos",
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
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

  generateReportDoc() {
    if (!store.loadingMonitoringItems) {
      return () async{
        showDialog(
            barrierColor: dialogBackgroundColor,
            barrierDismissible: false,
            context: context,
            builder: (_) => const LoadingDialog());
        await store.exportReportDoc(onError);
        Modular.to.pop();
      };
    }
    return null;
  }

  Future onError(DashboardError failure) async {
    if (failure is DashboardRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is DashboardUnknownError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }
}
