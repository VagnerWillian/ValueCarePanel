import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/classification_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/date_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/id_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/patient_name_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/refer_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/score_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/symptoms_column_grid.component.dart';

class MonitoringDataSource extends DataGridSource {

  final Function updateMonitoringItem;
  final Function onChangedRefer;

  List<MonitoringDataEntity>  _paginatedMonitoringItems = [];
  List<MonitoringDataEntity>  monitoringItems = [];
  final List<String> columnNames = ["ID", "Data", "Sintomas", "Paciente", "Score", "Classificação", "Data solicitação", "Encaminhar"];
  int rowsPerPage = 10;
  double pageCount = 1;

  @override
  List<DataGridRow> get rows =>  dataGridRows;
  List<DataGridRow>  dataGridRows = [];


  MonitoringDataSource({required this.updateMonitoringItem, required this.onChangedRefer});

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedMonitoringItems.map<DataGridRow>((m) => DataGridRow(cells: [
      DataGridCell<String>(columnName: columnNames[0], value: m.idString),
      DataGridCell<String>(columnName: columnNames[1], value: m.data),
      DataGridCell<List<SymptomEntity>>(columnName: columnNames[2], value: m.sintomas),
      DataGridCell<String>(columnName: columnNames[3], value: m.paciente),
      DataGridCell<String>(columnName: columnNames[4], value: m.score),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[5], value: m),
      DataGridCell<String>(columnName: columnNames[6], value: m.dataSolicitada),
      DataGridCell<bool>(columnName: columnNames[7], value: m.encaminhar),
    ])).toList(growable: false);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          if(dataGridCell.columnName==columnNames[0]){
            return IDColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[1]){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[2]){
            return SymptomsColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[3]){
            return PatientNameColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[4]){
            return ScoreColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[5]){
            return ClassificationColumnGrid(value: dataGridCell.value, onChangedClassification: updateMonitoringItem);
          }else if(dataGridCell.columnName==columnNames[6]){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[7]){
            return ReferColumnGrid(check: dataGridCell.value);
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