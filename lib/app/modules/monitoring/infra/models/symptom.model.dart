import 'package:value_panel/app/modules/monitoring/domain/entities/symptoms.entity.dart';

class Symptom implements SymptomEntity{

  @override
  String? dateReport;

  @override
  String? label;

  Symptom({this.label, this.dateReport});

  Symptom.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    dateReport = json['date_report'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['date_report'] = dateReport;
    return data;
  }
}
