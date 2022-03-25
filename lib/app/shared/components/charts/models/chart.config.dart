import 'package:value_panel/app/shared/components/charts/models/chart.data.item.dart';

class ChartDataConfig{
  late double maxY = 0;
  late double maxX = 0;
  late final int intervalY;
  late final List<ChartDataItem> group;

  ChartDataConfig({this.group = const [], this.intervalY = 10}){
    if(group.isNotEmpty) {
      double maxYValue = group.reduce((a, b) => a.value > b.value ? a : b).value;
      double maxYSecondValue = 0.0;
      double larger = maxYValue;
      if(group.first.secondValue!=null){
        maxYSecondValue = group.reduce((a, b) => a.secondValue! > b.secondValue! ? a : b).secondValue!;
        if(maxYSecondValue>maxYValue){
          larger = maxYSecondValue;
        }
      }
      maxY = larger + intervalY - (larger % intervalY - intervalY);
      maxX = (group.length - 1).toDouble();
    }
  }
}