import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class SymptomValueChartDataEntity<T>{
  late final double percentage;
  late final int quantity ;
  late final SymptomEntity symptom;
}