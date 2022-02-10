import 'package:value_panel/app/shared/components/charts/models/chart.data.item.dart';

class ChartDataConfig{
  final double maxY;
  final List<ChartDataItem> group;

  ChartDataConfig({required this.maxY, required this.group}){
    group.map((e){
      if(e.value>maxY){
        e.value=100;
      }
    }).toList();
  }
}