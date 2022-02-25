abstract class SymptomEntity {
  late int id;
  late String label;
  late String dateReport;
  late String srcImage;
  late String intensity;

  Map<String, dynamic> get toJson;
}
