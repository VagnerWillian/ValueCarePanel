abstract class SchedulingDataEntity {
  int? id;
  String? patient;
  String? solicitationDate;
  String? contactDate;
  String? score;
  int? classificationId;
  String? dateSolicited;
  String? appointmentDate;
  bool? confirmation;

  String get idString;
  DateTime get dateSolicitedInDateTime;
  DateTime? get appointmentDateInDateTime;

  SchedulingDataEntity(
      {this.id,
        this.patient,
        this.solicitationDate,
        this.contactDate,
        this.score,
        this.classificationId,
        this.dateSolicited,
        this.appointmentDate,
        this.confirmation});
}
