import '../../domain/entities/basic_value_data_chart.entity.dart';

class BasicValueChartData implements BasicValueChartDataEntity{

  @override
  late final String label;

  @override
  late final double? secondValue;

  @override
  late final double value;

  BasicValueChartData({required this.label, required this.secondValue, required this.value});

  BasicValueChartData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    secondValue = json['segundo_valor'];
    value = json['primeiro_valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['segundo_valor'] = secondValue;
    data['primeiro_valor'] = value;
    return data;
  }
}