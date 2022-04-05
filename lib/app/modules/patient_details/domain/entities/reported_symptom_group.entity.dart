import 'package:value_panel/app/modules/patient_details/domain/entities/reported_symptom_info.entity.dart';

abstract class ReportedSymptomGroupEntity{
  late final String periodName;
  late final int score;
  late final List<ReportedSymptomInfoEntity> items = [];
}