abstract class HistoryItemEntity{
  late final String id;
  bool hasRead = true;
  late final String operator;
  late final String text;
  late final String data;
  int? idNewClassification;
  String? newAppointmentDate;
  int? idNewSpecialty;
  bool? newStatusConfirmation;

  Map<String, dynamic> get toJson;
}