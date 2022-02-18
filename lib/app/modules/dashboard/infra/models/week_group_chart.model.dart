import 'package:value_panel/app/modules/dashboard/domain/entities/chart/week_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/basic_value_chart.model.dart';

class WeekGroupChartData<T> implements WeekGroupChartDataEntity{

  @override
  late String comparison = '';

  @override
  late int quantity = 0;

  @override
  List values = <T>[];

  WeekGroupChartData();

  WeekGroupChartData.fromJson(Map<String, dynamic> json){
    comparison = json['comparacao']??0;
    quantity = json['quantidade']??0;
    values = (json['valores'] as List).map((e) {
      return BasicValueChartData.fromJson(e);
    }).toList();
  }

}