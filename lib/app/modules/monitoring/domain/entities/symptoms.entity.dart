abstract class SymptomEntity {
  String? label;
  String? dateReport;

  SymptomEntity({this.label, this.dateReport});

  Map<String, dynamic> get toJson;
}
