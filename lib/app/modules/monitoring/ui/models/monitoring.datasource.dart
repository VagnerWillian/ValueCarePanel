import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/classification.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/modules/monitoring/infra/models/classification.model.dart';
import 'package:value_panel/app/shared/utils.dart';

class MonitoringDataSource extends DataGridSource {

  List<DataGridRow>  monitoringData = [];
  List<String>  _columnNames = [];

  @override
  List<DataGridRow> get rows =>  monitoringData;

  MonitoringDataSource({required List<MonitoringDataEntity> monitoringItems, required List<String> columnNames}) {
    _columnNames = columnNames;
    monitoringData = monitoringItems
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: _columnNames[0], value: e.idString),
      DataGridCell<String>(columnName: _columnNames[1], value: e.data),
      DataGridCell<List<SymptomEntity>>(columnName: _columnNames[2], value: e.sintomas),
      DataGridCell<String>(columnName: _columnNames[3], value: e.paciente),
      DataGridCell<String>(columnName: _columnNames[4], value: e.score),
      DataGridCell<String>(columnName: _columnNames[5], value: e.classificacao),
      DataGridCell<String>(columnName: _columnNames[6], value: e.dataSolicitada),
      DataGridCell<bool>(columnName: _columnNames[7], value: e.encaminhar),
    ]))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          if(dataGridCell.columnName==_columnNames[0]||dataGridCell.columnName==_columnNames[1]||dataGridCell.columnName==_columnNames[6]){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Text(dataGridCell.value, style: GoogleFonts.openSans(fontSize: 12, fontWeight: dataGridCell.columnName==_columnNames[0]?FontWeight.w600:FontWeight.normal)),
            );
          }else if(dataGridCell.columnName==_columnNames[2]){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Badge(
                    position: BadgePosition.topStart(),
                    showBadge: dataGridCell.value.length>1,
                    padding: const EdgeInsets.all(7),
                    badgeContent: Text("!", style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),),
                    child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                        child: Center(child: SvgPicture.network('assets/images/symptoms/${dataGridCell.value[0].label}.svg', color: Colors.white))),
                  ),
                  const SizedBox(width: 5,),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: dataGridCell.value[0].label,
                                style:GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                            ),
                            TextSpan(text: dataGridCell.value.length>1?"\ne mais ${dataGridCell.value.length-1}":"\nsomente",
                                style:GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey)
                            ),
                          ]
                      ),
                    ),
                  )
                ],
              ),
            );
          }else if(dataGridCell.columnName==_columnNames[3]){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                      child: Center(child: SvgPicture.asset('assets/images/menu/pacientes.svg', color: primaryColor, width: 12,))),
                  const SizedBox(width: 5,),
                  Expanded(child: Text(dataGridCell.value.toString(), style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w600))),
                ],
              ),
            );
          }else if(dataGridCell.columnName==_columnNames[4]){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Text(dataGridCell.value, style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.bold, color: primaryColor)),
            );
          }else if(dataGridCell.columnName==_columnNames[5]){
            List<ClassificationEntity> items = [
              Classification(label: "Pendente", id: 0, color: HexColor("#6418C3")),
              Classification(label: "Não Urgente", id: 1, color: HexColor("#34A8D9")),
              Classification(label: "Emergência", id: 2, color: HexColor("#E23838")),
              Classification(label: "Urgente", id: 3, color: HexColor("#FFAB2D")),
              Classification(label: "Pouco Urgente", id: 4, color: HexColor("#38E25D")),
            ];
            return Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: items[3].color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 150,
                height: 80,
                child: DropdownButton<ClassificationEntity>(
                  borderRadius: BorderRadius.circular(5),
                  value: items[3],
                  underline: Container(),
                  isExpanded: true,
                  iconEnabledColor: items[3].color,
                  items: items.map((c) {
                    return DropdownMenuItem<ClassificationEntity>(
                      value: c,
                      child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/classifications/${c.label}.svg", color: c.color, width: 20,),
                        const SizedBox(width: 10),
                        Text(c.label, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 10, color: c.color), overflow: TextOverflow.fade, softWrap: true,)
                      ],
                    ));
                  }).toList(),
                  onChanged: (v){},
                ),
              ),
            );
          }else if(dataGridCell.columnName==_columnNames[7]){
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                onChanged: (v){},
                value: dataGridCell.value,
                fillColor: MaterialStateProperty.all(primaryColor),
              )
            );
          }
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }
}