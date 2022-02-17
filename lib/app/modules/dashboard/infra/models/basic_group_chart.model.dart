import 'package:value_panel/app/modules/dashboard/domain/entities/basic_group_chart.entity.dart';
import 'package:value_panel/app/modules/dashboard/infra/models/classification_value_chart.model.dart';

class BasicGroupChartData<T> implements BasicGroupChartDataEntity{

  @override
  late List values = <T>[];

  BasicGroupChartData();

  BasicGroupChartData.fromJson(Map<String, dynamic> json){
    values = (json['valores'] as List).map((e) {
      return ClassificationValueChartData.fromJson(e);
    }).toList();
  }

}