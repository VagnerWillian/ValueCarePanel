
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/monitoring.datasource.dart';
import 'package:value_panel/app/modules/monitoring/ui/models/date_selector.model.dart';
import 'package:value_panel/app/modules/monitoring/ui/monitoring_store.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:value_panel/app/shared/widgets/custom/gradient.button.dart';
import 'package:value_panel/app/shared/widgets/dialogs/loading.dialog.dart';
import 'package:value_panel/app/shared/widgets/page_title_description.widget.dart';
import 'package:value_panel/app/shared/widgets/search/main_search.widget.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({Key? key}) : super(key: key);
  @override
  MonitoringPageState createState() => MonitoringPageState();
}
class MonitoringPageState extends State<MonitoringPage> {

  final MonitoringStore store = Modular.get();

  @override
  void initState() {
    store.onChangedSelectorDate(store.preDates[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const PageTitleDescription(title: "Classificação", subtitle: "Classifique os pacientes aqui"),
                const Expanded(
                    flex: 2,
                    child: MainSearch()
                ),
                Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 80,
                            offset: const Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(LineAwesomeIcons.calendar, color: primaryColor,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Observer(
                            builder: (_) =>
                                DropdownButton<DateSelector>(
                                  underline: Container(),
                                  borderRadius: BorderRadius.circular(10),
                                  value: store.dateSelector,
                                  items: store.preDates.map((d) {
                                    final startDatePattern = DateFormat("d 'de' MMMM", "pt_BR");
                                    final endDatePattern = DateFormat("d 'de' MMMM ',' y'", "pt_BR");

                                    return DropdownMenuItem<DateSelector>(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            d.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.start,),
                                          Text("${startDatePattern.format(d.startDate)} • ${endDatePattern.format(d.endDate)}",
                                              style: const TextStyle(color: Colors.grey, fontSize: 10), textAlign: TextAlign.start),
                                        ],
                                      ),
                                      value: d,
                                    );
                                  }).toList(),
                                  onChanged: (v) => store.onChangedSelectorDate(v!),
                                ),
                          ),
                        ),
                      ],
                    )
                ),
                Observer(
                  builder: (_) =>
                      GradientButton(
                        height: 50,
                        onPressed: generateReportDoc(),
                        gradient: LinearGradient(
                          colors: store.loadingMonitoringItems ? [Colors.grey, Colors.grey] : gradientColors,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: [
                            const Icon(LineAwesomeIcons.pie_chart, color: Colors.white,),
                            const SizedBox(width: 5,),
                            Text("Gerar Relatório", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),),
                          ],
                        ),
                      ),
                )
              ],
            ),
            const SizedBox(height: 40,),
            Observer(builder: (_) {
              MonitoringDataSource _adapter = MonitoringDataSource(monitoringItems: store.monitoringDataItems);

              return store.loadingMonitoringItems ? Center(child: SizedBox(
              width: 250, height: 250,
              child: FlareActor(
                'assets/anims/loading.flr',
                animation: 'loading',
                color: primaryColor,
              ),
            )) : Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 80,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    color: Colors.white, borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                child: SfDataGrid(
                  shrinkWrapRows: true,
                  allowSorting: true,
                  columnWidthMode: ColumnWidthMode.fill,
                  gridLinesVisibility: GridLinesVisibility.none,
                  headerGridLinesVisibility: store.loadingMonitoringItems ? GridLinesVisibility.none : GridLinesVisibility.horizontal,
                  source: _adapter,
                  rowHeight: 65,
                  isScrollbarAlwaysShown: true,
                  columns: _adapter.columnNames.map((e) {
                    return GridColumn(
                        columnName: e,
                        label: Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(e,
                              style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
                            )));
                  }).toList(),
                ),
              ),
            );
            }),
          ],
        ),
      ),
    );
  }

  generateReportDoc() {
      if(store.enableGenerateReportDoc) {
        return () {
          showDialog(
              barrierColor: dialogBackgroundColor,
              barrierDismissible: false,
              context: context, builder: (_) => LoadingDialog(future: store.exportReportDoc()));
        };
      }
      return null;
  }
}