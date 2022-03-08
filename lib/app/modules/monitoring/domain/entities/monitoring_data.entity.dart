import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

abstract class MonitoringDataEntity {
  late final String id;
  late final List<SymptomEntity> symptoms;
  late final String patient;
  late int classificationId;
  late int? specialtyId;
  late final String solicitationDate;
  late String? appointmentDate;
  late bool confirm;

  String get idString;
  DateTime? get appointmentDateInDateTime;
}
