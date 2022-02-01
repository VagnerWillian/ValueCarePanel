import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/scheduling/ui/components/selector_date.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/scheduling_store.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:value_panel/app/shared/widgets/custom/gradient.button.dart';
import 'package:value_panel/app/shared/widgets/dialogs/loading.dialog.dart';
import 'package:value_panel/app/shared/widgets/page_title_description.widget.dart';
import 'package:value_panel/app/shared/widgets/search/main_search.widget.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);
  @override
  SchedulingPageState createState() => SchedulingPageState();
}

class SchedulingPageState extends State<SchedulingPage> {
  final SchedulingStore store = Modular.get();

  @override
  void dispose() {
    store.dataPagerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      return store.loadingSchedulingItems
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
      const PageTitleDescription(title: "Agendamentos", subtitle: "Agende os pacientes por aqui"),
      Expanded(
          flex: 2,
          child: Observer(
            builder:(_)=> IgnorePointer(
              ignoring: store.loadingUpdateSchedulingItem,
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
                child: SelectorDateWidget(onChangedSelectorDate: store.onChangedSelectorDate),
              ),
            ],
          )),
      Observer(
        builder: (_) => GradientButton(
          height: 50,
          onPressed: generateReportDoc(),
          gradient: LinearGradient(
            colors: store.loadingSchedulingItems ? [Colors.grey, Colors.grey] : gradientColors,
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
        source: store.schedulingDataSource,
        rowHeight: _rowHeight,
        columns: store.schedulingDataSource.columnNames.map((e) {
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
      ignoring: store.loadingUpdateSchedulingItem,
      child: SfDataPager(
        controller: store.dataPagerController,
        delegate: store.schedulingDataSource,
        pageCount: store.schedulingDataSource.pageCount,
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

  generateReportDoc() {
    if (store.enableGenerateReportDoc) {
      return () {
        showDialog(
            barrierColor: dialogBackgroundColor,
            barrierDismissible: false,
            context: context,
            builder: (_) => LoadingDialog(future: store.exportReportDoc()));
      };
    }
    return null;
  }
}
