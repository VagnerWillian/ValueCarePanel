class ChartDataItem{
  final String bottomLabel;
  late double value;
  ChartDataItem(this.bottomLabel, this.value){
    if(value>100){
      value=100;
    }
  }
}