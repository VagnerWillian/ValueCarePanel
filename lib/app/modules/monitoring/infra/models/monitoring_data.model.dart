import 'package:intl/intl.dart';
import 'package:value_panel/app/modules/monitoring/domain/entities/monitoring_data.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';
import 'package:value_panel/app/shared/core/infra/models/symptom.model.dart';

class MonitoringData implements MonitoringDataEntity {

  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  late int classificationId;

  @override
  late int? specialtyId;

  @override
  late final String solicitationDate;

  @override
  late bool confirm;

  @override
  late final String id;

  @override
  late final String patient;

  @override
  late final List<SymptomEntity> symptoms;

  @override
  String get idString => "#$id";

  @override
  String? appointmentDate;

  @override
  DateTime? get appointmentDateInDateTime => appointmentDate==null?null:DateTime.parse(appointmentDate!);

  MonitoringData(
      {required this.id,
      required this.symptoms,
      required this.patient,
      required this.classificationId,
      required this.solicitationDate,
      required this.appointmentDate,
      required this.confirm});

  MonitoringData.fromJson(Map<String, dynamic> json) {
;    id = json['id'];
    symptoms = (json['sintomas'] as List).map((s) => Symptom.fromJson(s)).toList();
    patient = json['paciente'];
    classificationId = json['classificacaoId'];
    specialtyId = json['especialidadeId'];
    solicitationDate = datePattern.format(DateTime.parse(json['dataSolicitacao']));
    confirm = json['confirmado'];
    appointmentDate = json['dataAgendamento'];
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sintomas'] = symptoms.map((e) => e.toJson).toList();
    data['paciente'] = patient;
    data['classificacaoId'] = classificationId;
    data['especialidadeId'] = specialtyId;
    data['dataSolicitacao'] = solicitationDate;
    data['confirmado'] = confirm;
    data['dataAgendamento'] = appointmentDate;
    return data;
  }
}
