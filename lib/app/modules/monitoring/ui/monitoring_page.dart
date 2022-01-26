
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/ui/components/selector_date.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/monitoring.datasource.dart';
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
    // store.onChangedSelectorDate(store.preDates[0], setDataRange: null);
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
                Expanded(
                    flex: 2,
                    child: MainSearch(
                      onTextChanged: store.onChangedSearchText,
                    )
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
                          child: SelectorDateWidget(onChangedSelectorDate: store.onChangedSelectorDate),
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
              MonitoringDataSource _monitoringDataSource = MonitoringDataSource(monitoringItems: store.monitoringDataItems, rowsPerPage: store.rowsPerPage);

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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDataGrid(dataSource: _monitoringDataSource),
                        SfDataPagerTheme(
                          data: SfDataPagerThemeData(
                            selectedItemColor: primaryColor,
                            itemBorderRadius: BorderRadius.circular(5),
                            selectedItemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white),
                            itemTextStyle: GoogleFonts.cairo(fontWeight: FontWeight.w800, color: Colors.black)
                          ),
                          child: SfDataPager(
                            delegate: _monitoringDataSource,
                            pageCount: store.pageCount,
                            direction: Axis.horizontal,
                            pageItemBuilder: (str){
                              if(str=="First"){
                                return Icon(LineAwesomeIcons.step_backward, color: primaryColor, size: 18);
                              }else if(str=="Last"){
                                return Icon(LineAwesomeIcons.step_forward, color: primaryColor, size: 18);
                              }else if(str=="Previous"){
                                return Icon(LineAwesomeIcons.angle_left, color: primaryColor, size: 18);
                              }else if(str=="Next"){
                                return Icon(LineAwesomeIcons.angle_right, color: primaryColor, size: 18);
                              }
                            },
                          ),
                        )
                    ])
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _buildDataGrid({required MonitoringDataSource dataSource}){
    const double _rowHeight = 65.0;
    return Expanded(
      child: SfDataGrid(
        shrinkWrapRows: true,
        allowSorting: true,
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.none,
        headerGridLinesVisibility: GridLinesVisibility.horizontal,
        source: dataSource,
        headerRowHeight: _rowHeight,
        rowHeight: _rowHeight,
        isScrollbarAlwaysShown: true,
        columns: dataSource.columnNames.map((e) {
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