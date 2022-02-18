import 'package:value_panel/app/modules/dashboard/domain/entities/chart/symptoms_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/symptoms_value_chart.model.dart';

class SymptomsGroupChartData<T> implements SymptomsGroupChartDataEntity{

  @override
  late final String comparison;

  @override
  late List values = <T>[];

  SymptomsGroupChartData();

  SymptomsGroupChartData.fromJson(Map<String, dynamic> json){
    comparison = json['data']??"";
    values = (json['valores'] as List).map((e) {
      return SymptomsValueChartData.fromJson(e);
    }).toList();
  }

}