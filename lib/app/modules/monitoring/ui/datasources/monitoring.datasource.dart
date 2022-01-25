import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/classification.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/classification_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/date_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/id_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/patient_name_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/refer_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/score_column_grid.component.dart';
import 'package:value_panel/app/modules/monitoring/ui/datasources/row_components/symptoms_column_grid.component.dart';
import 'package:value_panel/app/shared/utils.dart';
import 'package:flutter/material.dart';

class MonitoringDataSource extends DataGridSource {

  List<DataGridRow>  monitoringData = [];
  final List<String> columnNames = ["ID", "Data", "Sintomas", "Paciente", "Score", "Classificação", "Data solicitação", "Encaminhar"];

  @override
  List<DataGridRow> get rows =>  monitoringData;

  MonitoringDataSource({required List<MonitoringDataEntity> monitoringItems}) {
    monitoringData = monitoringItems.map<DataGridRow>((m) => DataGridRow(cells: [
      DataGridCell<String>(columnName: columnNames[0], value: m.idString),
      DataGridCell<String>(columnName: columnNames[1], value: m.data),
      DataGridCell<List<SymptomEntity>>(columnName: columnNames[2], value: m.sintomas),
      DataGridCell<String>(columnName: columnNames[3], value: m.paciente),
      DataGridCell<String>(columnName: columnNames[4], value: m.score),
      DataGridCell<ClassificationEntity>(columnName: columnNames[5], value: m.classificacao),
      DataGridCell<String>(columnName: columnNames[6], value: m.dataSolicitada),
      DataGridCell<bool>(columnName: columnNames[7], value: m.encaminhar),
    ])).toList();
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
            return ClassificationColumnGrid(value: dataGridCell.value);
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
}