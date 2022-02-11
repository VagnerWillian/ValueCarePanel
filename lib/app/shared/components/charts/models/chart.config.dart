import 'package:value_panel/app/shared/components/charts/models/chart.data.item.dart';

class ChartDataConfig{
  double maxY = 0;
  int intervalY;
  final List<ChartDataItem> group;

  ChartDataConfig({required this.group, this.intervalY=10}){
    maxY = group.reduce((a, b) => a.value>b.value ? a : b).value;
    maxY = maxY+intervalY-(maxY%intervalY - intervalY);
  }
}