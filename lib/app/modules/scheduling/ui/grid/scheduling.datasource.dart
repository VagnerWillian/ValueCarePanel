import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/appointment_date_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/classification_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/date_contact_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/id_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/patient_name_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/refer_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/score_column_grid.component.dart';
import 'package:value_panel/app/modules/scheduling/ui/grid/row_components/solicited_date_column_grid.component.dart';
class ColumnConfig{
  String label;
  double minWidth, maxWidth;

  ColumnConfig(this.label, this.minWidth, this.maxWidth);
}
class SchedulingDataSource extends DataGridSource {

  final Function updateSchedulingItem;

  List<SchedulingDataEntity>  _paginatedSchedulingItems = [], schedulingItems = [];
  final List<ColumnConfig> columnNames = [
    ColumnConfig("ID", 60, double.nan),
    ColumnConfig("Paciente", 100, double.nan),
    ColumnConfig("Data Contato", 70, double.nan),
    ColumnConfig("Data Solicitação", 70, double.nan),
    ColumnConfig("Score", 30, 60),
    ColumnConfig("Classificação", 150, double.nan),
    ColumnConfig("Data Solicitada", 150, double.nan),
    ColumnConfig("Data Consulta", 150, double.nan),
    ColumnConfig("Confirmação", 20, double.nan),
  ];

  int rowsPerPage = 10;
  double pageCount = 1;

  @override
  List<DataGridRow> get rows =>  dataGridRows;
  List<DataGridRow>  dataGridRows = [];


  SchedulingDataSource({required this.updateSchedulingItem});

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedSchedulingItems.map<DataGridRow>((m) => DataGridRow(cells: [
      DataGridCell<String>(columnName: columnNames[0].label, value: m.idString),
      DataGridCell<String>(columnName: columnNames[1].label, value: m.patient),
      DataGridCell<String>(columnName: columnNames[2].label, value: m.contactDate),
      DataGridCell<String>(columnName: columnNames[3].label, value: m.solicitationDate),
      DataGridCell<String>(columnName: columnNames[4].label, value: m.score),
      DataGridCell<int>(columnName: columnNames[5].label, value: m.classificationId),
      DataGridCell<SchedulingDataEntity>(columnName: columnNames[6].label, value: m),
      DataGridCell<SchedulingDataEntity>(columnName: columnNames[7].label, value: m),
      DataGridCell<SchedulingDataEntity>(columnName: columnNames[8].label, value: m),
    ])).toList(growable: false);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          if(dataGridCell.columnName==columnNames[0].label){
            return IDColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[1].label){
            return PatientNameColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[2].label){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[3].label){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[4].label){
            return ScoreColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[5].label){
            return ClassificationColumnGrid(value: dataGridCell.value, classifications: const []);
          }else if(dataGridCell.columnName==columnNames[6].label){
            return SolicitedDateColumnGrid(schedulingDataEntity: dataGridCell.value, updateSchedulingItem: updateSchedulingItem);
          }else if(dataGridCell.columnName==columnNames[7].label){
            return AppointmentDateColumnGrid(schedulingDataEntity: dataGridCell.value, updateSchedulingItem: updateSchedulingItem);
          } else if(dataGridCell.columnName==columnNames[8].label){
            return ReferColumnGrid(value: dataGridCell.value, updateSchedulingItem: updateSchedulingItem);
          }
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }

  updateList(List<SchedulingDataEntity> values){
    schedulingItems = values;
    rowsPerPage = schedulingItems.length<10?schedulingItems.length:10;
    pageCount = (schedulingItems.length | rowsPerPage)<=0 ? 1: (schedulingItems.length / rowsPerPage).ceilToDouble();
    buildPaginatedDataGridRows();
    notifyListeners();
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if(endIndex>schedulingItems.length) {
      endIndex = schedulingItems.length;
    }
    if (startIndex < schedulingItems.length && endIndex <= schedulingItems.length) {
      _paginatedSchedulingItems = schedulingItems.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      _paginatedSchedulingItems = [];
    }

    return true;
  }

////////////////////////////////////////////////////////////////////////////////////////
}