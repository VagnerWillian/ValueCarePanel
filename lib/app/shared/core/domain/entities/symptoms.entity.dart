abstract class SymptomEntity {
  late final String id;
  late final String label;
  late final String dateReport;
  late final String srcImage;
  late final String intensity;

  Map<String, dynamic> get toJson;
}
