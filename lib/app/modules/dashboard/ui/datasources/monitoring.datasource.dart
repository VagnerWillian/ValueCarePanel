import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/dashboard/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/classification_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/date_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/id_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/patient_name_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/refer_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/score_column_grid.component.dart';
import 'package:value_panel/app/modules/dashboard/ui/datasources/row_components/symptoms_column_grid.component.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
class ColumnConfig{
  String label;
  double minWidth, maxWidth;

  ColumnConfig(this.label, this.minWidth, this.maxWidth);
}
class MonitoringDataSource extends DataGridSource {

  final Function updateMonitoringItem;

  List<MonitoringDataEntity>  _paginatedMonitoringItems = [], monitoringItems = [];
  final List<ColumnConfig> columnNames = [
    ColumnConfig("ID", 60, double.nan),
    ColumnConfig("Data", 70, double.nan),
    ColumnConfig("Sintomas", 160, double.nan),
    ColumnConfig("Paciente", 100, double.nan),
    ColumnConfig("Score", 30, 60),
    ColumnConfig("Classificação", 150, double.nan),
    ColumnConfig("Data Solicitação", 70, double.nan),
    ColumnConfig("Encaminhar", 20, double.nan),
  ];

  int rowsPerPage = 10;
  double pageCount = 1;

  @override
  List<DataGridRow> get rows =>  dataGridRows;
  List<DataGridRow>  dataGridRows = [];


  MonitoringDataSource({required this.updateMonitoringItem});

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedMonitoringItems.map<DataGridRow>((m) => DataGridRow(cells: [
      DataGridCell<String>(columnName: columnNames[0].label, value: m.idString),
      DataGridCell<String>(columnName: columnNames[1].label, value: m.date),
      DataGridCell<List<SymptomEntity>>(columnName: columnNames[2].label, value: m.symptoms),
      DataGridCell<String>(columnName: columnNames[3].label, value: m.patient),
      DataGridCell<String>(columnName: columnNames[4].label, value: m.score),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[5].label, value: m),
      DataGridCell<String>(columnName: columnNames[6].label, value: m.solicitationDate),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[7].label, value: m),
    ])).toList(growable: false);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          if(dataGridCell.columnName==columnNames[0].label){
            return IDColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[1].label){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[2].label){
            return SymptomsColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[3].label){
            return PatientNameColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[4].label){
            return ScoreColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[5].label){
            return ClassificationColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem);
          }else if(dataGridCell.columnName==columnNames[6].label){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[7].label){
            return ReferColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem);
          }
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }

  updateList(List<MonitoringDataEntity> values){
    monitoringItems = values;
    rowsPerPage = monitoringItems.length<10?monitoringItems.length:10;
    pageCount = (monitoringItems.length | rowsPerPage)<=0 ? 1: (monitoringItems.length / rowsPerPage).ceilToDouble();
    buildPaginatedDataGridRows();
    notifyListeners();
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;
    if(endIndex>monitoringItems.length) {
      endIndex = monitoringItems.length;
    }
    if (startIndex < monitoringItems.length && endIndex <= monitoringItems.length) {
      _paginatedMonitoringItems = monitoringItems.getRange(startIndex, endIndex).toList(growable: false);
      buildPaginatedDataGridRows();
      notifyListeners();
    } else {
      _paginatedMonitoringItems = [];
    }

    return true;
  }

////////////////////////////////////////////////////////////////////////////////////////
}