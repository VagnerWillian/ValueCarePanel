import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

class Symptom implements SymptomEntity{

  @override
  int? id;

  @override
  String? dateReport;

  @override
  String? label;

  Symptom({this.id, this.label, this.dateReport});

  Symptom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    dateReport = json['date_report'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['date_report'] = dateReport;
    return data;
  }
}
