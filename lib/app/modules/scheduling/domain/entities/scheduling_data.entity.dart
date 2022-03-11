abstract class SchedulingDataEntity {
  late final String id;
  late final String patient;
  late final String idPatient;
  late final String solicitationDate;
  late final String contactDate;
  late final String score;
  int? classificationId;
  String? dateSolicited;
  String? appointmentDate;
  bool? confirmation;

  String get idString;
  DateTime get dateSolicitedInDateTime;
  DateTime? get appointmentDateInDateTime;
}
