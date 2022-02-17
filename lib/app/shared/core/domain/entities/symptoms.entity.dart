abstract class SymptomEntity {
  late int id;
  late String label;
  late String dateReport;
  late String srcImage;

  Map<String, dynamic> get toJson;
}
