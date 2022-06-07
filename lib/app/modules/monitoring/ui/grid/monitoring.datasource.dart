import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/appointment_date_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/classification_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/date_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/history_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/patient_name_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/confirm_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/specialty_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/grid/row_components/symptoms_column_grid.component.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
class ColumnConfig{
  String label;
  double minWidth, maxWidth;

  ColumnConfig(this.label, this.minWidth, this.maxWidth);
}
class MonitoringDataSource extends DataGridSource {

  final Function updateMonitoringItem;
  final Function({required List<String> idUserAndPatient}) openHistoryFloating;
  final Function openPatientDetails;
  final List<ClassificationEntity> classifications;
  final List<SpecialtyEntity> specialties;

  List<MonitoringDataEntity>  _paginatedMonitoringItems = [], monitoringItems = [];
  final List<ColumnConfig> columnNames = [
    ColumnConfig("Paciente", double.nan, double.nan),
    ColumnConfig("Sintomas", 160, 250),
    ColumnConfig("Classificação", 150, 200),
    ColumnConfig("Data Solicitação", 70, 100),
    ColumnConfig("Data agendamento", 125, 160),
    ColumnConfig("Especialidade", 160, double.nan),
    ColumnConfig("Confirmado", 30, 100),
    ColumnConfig("Histórico", 40, 100),
  ];

  int rowsPerPage = 10;
  double pageCount = 1;

  @override
  List<DataGridRow> get rows =>  dataGridRows;
  List<DataGridRow>  dataGridRows = [];


  MonitoringDataSource({required this.updateMonitoringItem, required this.classifications, required this.specialties, required this.openHistoryFloating, required this.openPatientDetails});

  void buildPaginatedDataGridRows() {
    dataGridRows = _paginatedMonitoringItems.map<DataGridRow>((m) => DataGridRow(cells: [
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[0].label, value: m),
      DataGridCell<List<SymptomEntity>>(columnName: columnNames[1].label, value: m.symptoms),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[2].label, value: m),
      DataGridCell<String>(columnName: columnNames[3].label, value: m.solicitationDate),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[4].label, value: m),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[5].label, value: m),
      DataGridCell<MonitoringDataEntity>(columnName: columnNames[6].label, value: m),
      DataGridCell<List<String>>(columnName: columnNames[7].label, value: [m.idUserPatient, m.idPatient]),
    ])).toList(growable: false);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
         if(dataGridCell.columnName==columnNames[0].label){
           return PatientNameColumnGrid(value: dataGridCell.value, openPatientDetails: openPatientDetails);
         }else if(dataGridCell.columnName==columnNames[1].label){
            return SymptomsColumnGrid(value: dataGridCell.value);
         }else if(dataGridCell.columnName==columnNames[2].label){
            return ClassificationColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem, classifications: classifications);
          }else if(dataGridCell.columnName==columnNames[3].label){
            return DateColumnGrid(value: dataGridCell.value);
          }else if(dataGridCell.columnName==columnNames[4].label){
            return AppointmentDateColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem);
          }else if(dataGridCell.columnName==columnNames[5].label){
            return SpecialtyColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem, specialties: specialties);
          }else if(dataGridCell.columnName==columnNames[6].label){
            return ConfirmColumnGrid(value: dataGridCell.value, updateMonitoringItem: updateMonitoringItem);
          }else if(dataGridCell.columnName==columnNames[7].label){
            return HistoryColumnGrid(idUserAndPatient: dataGridCell.value, openHistoryFloating: openHistoryFloating);
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