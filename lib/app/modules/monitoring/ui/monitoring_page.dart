import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:value_panel/app/modules/monitoring/errors/monitoring.errors.dart';
import 'package:value_panel/app/shared/core/infra/models/date_selector.model.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_store.dart';
import 'package:value_panel/app/shared/components/custom/gradient.button.dart';
import 'package:value_panel/app/shared/components/dialogs/another_error.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/loading.dialog.dart';
import 'package:value_panel/app/shared/components/dialogs/repository_error.dialog.dart';
import 'package:value_panel/app/shared/components/page_title_description.widget.dart';
import 'package:value_panel/app/shared/components/search/main_search.widget.dart';
import 'package:value_panel/app/utils/utils.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({Key? key}) : super(key: key);
  @override
  MonitoringPageState createState() => MonitoringPageState();
}

class MonitoringPageState extends State<MonitoringPage> {
  final MonitoringStore store = Modular.get();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      store.setDateSelector(store.preDates.first);
      onChangedDate(store.preDates.first);
    });
    super.initState();
  }

  @override
  void dispose() {
    store.dataPagerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 80,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ], color: Colors.white, borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                  child: Observer(
                    builder: (_) {
                      return store.loadingMonitoringItems
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
                        : Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            _buildDataGrid(),
                            _buildGridPages()
                          ]);
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader()=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const PageTitleDescription(title: "Classificação", subtitle: "Classifique os pacientes aqui"),
      Expanded(
          flex: 2,
          child: Observer(
            builder:(_)=> IgnorePointer(
              ignoring: store.loadingUpdateMonitoringItem,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100.0,
                ),
                child:MainSearch(
                  onTextChanged: store.onChangedSearchText,
                ),
              ),
            ),
          )),
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
          height: 55,
          onPressed: generateReportDoc(),
          gradient: LinearGradient(
            colors: store.loadingMonitoringItems ? [Colors.grey, Colors.grey] : gradientColors,
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
      )
    ],
  );

  Widget _buildDataGrid() {
    const double _rowHeight = 65.0;
    return Expanded(
      child: SfDataGrid(
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
      ),
    );
  }

  Widget _buildGridPages()=>SfDataPagerTheme(
    data: SfDataPagerThemeData(
        selectedItemColor: primaryColor,
        itemBorderRadius: BorderRadius.circular(5),
        selectedItemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
        itemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.w800, color: Colors.black)),
    child: IgnorePointer(
      ignoring: store.loadingUpdateMonitoringItem,
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

  Future onError(MonitoringError failure)async{
    if(failure is MonitoringRepositoryError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>RepositoryErrorDialog(repositoryError: failure));
    }else if(failure is MonitoringUnknownError){
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_)=>UnknownErrorDialog(unknownError: failure));
    }
  }
}