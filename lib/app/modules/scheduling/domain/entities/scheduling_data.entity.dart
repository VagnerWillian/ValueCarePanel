abstract class SchedulingDataEntity {
  int? id;
  String? patient;
  String? solicitationDate;
  String? contactDate;
  String? score;
  int? classification;
  String? dateSolicited;
  String? appointmentDate;
  bool? confirmation;

  String get idString;

  SchedulingDataEntity(
      {this.id,
        this.patient,
        this.solicitationDate,
        this.contactDate,
        this.score,
        this.classification,
        this.dateSolicited,
        this.appointmentDate,
        this.confirmation});
}
