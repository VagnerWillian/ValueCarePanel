import 'package:intl/intl.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';

class SchedulingData implements SchedulingDataEntity{
  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  int? classificationId;

  @override
  bool? confirmation;

  @override
  String? appointmentDate;

  @override
  late final String contactDate;

  @override
  late final String solicitationDate;

  @override
  String? dateSolicited;

  @override
  late final String id;

  @override
  late final String patient;

  @override
  late final String idPatient;

  @override
  late final String score;

  @override
  String get idString => "#$id";

  @override
  DateTime get dateSolicitedInDateTime => DateTime.parse(dateSolicited!);

  @override
  DateTime? get appointmentDateInDateTime => appointmentDate==null?null:DateTime.parse(appointmentDate!);


  SchedulingData(
      {this.classificationId,
      this.confirmation,
      this.appointmentDate,
      required this.contactDate,
      required this.solicitationDate,
      this.dateSolicited,
      required this.id,
      required this.patient,
      required this.idPatient,
      required this.score});

  SchedulingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient = json['paciente'];
    idPatient = json['idPaciente'];
    solicitationDate = datePattern.format(DateTime.parse(json['dataSolicitacao']));
    contactDate = datePattern.format(DateTime.parse(json['dataContato']));
    score = json['score'];
    classificationId = json['classificacaoID'];
    dateSolicited = json['dataSolicitada'];
    appointmentDate = json['dataConsulta'];
    confirmation = json['confirmacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paciente'] = patient;
    data['idPatient'] = idPatient;
    data['dataSolicitacao'] = solicitationDate;
    data['dataContato'] = contactDate;
    data['score'] = score;
    data['classificacaoId'] = classificationId;
    data['dataSolicitada'] = dateSolicited;
    data['dataConsulta'] = appointmentDate;
    data['confirmacao'] = confirmation;
    return data;
  }

}
