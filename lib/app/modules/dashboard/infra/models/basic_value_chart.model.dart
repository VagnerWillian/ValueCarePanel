import '../../domain/entities/chart/basic_value_chart.entity.dart';

class BasicValueChartData implements BasicValueChartDataEntity{

  @override
  double value = 0;

  @override
  String comparison = 'Nan';

  BasicValueChartData();

  BasicValueChartData.fromJson(Map<String, dynamic> json) {
    value = json['valor']??0;
    comparison = json['comparacao']??"Nan";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['valor'] = value;
    data['comparacao'] = comparison;
    return data;
  }
}