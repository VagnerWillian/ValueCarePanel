import 'package:value_panel/app/shared/components/charts/models/chart.data.item.dart';

class ChartDataConfig{
  late double maxY = 0;
  late double maxX = 0;
  late final int intervalY;
  late final List<ChartDataItem> group;

  ChartDataConfig({this.group = const [], this.intervalY = 10}){
    if(group.isNotEmpty) {
      maxY = group.reduce((a, b) => a.value > b.value ? a : b).value;
      maxY = maxY + intervalY - (maxY % intervalY - intervalY);
      maxX = (group.length - 1).toDouble();
    }
  }
}