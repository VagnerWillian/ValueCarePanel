import 'package:intl/intl.dart';
import 'package:value_panel/app/modules/scheduling/domain/entities/scheduling_data.entity.dart';

class SchedulingData implements SchedulingDataEntity{
  final datePattern = DateFormat("dd/MM/yyyy", "pt_BR");

  @override
  int? classification;

  @override
  bool? confirmation;

  @override
  String? appointmentDate;

  @override
  String? contactDate;

  @override
  String? solicitationDate;

  @override
  String? dateSolicited;

  @override
  int? id;

  @override
  String? patient;

  @override
  String? score;

  @override
  String get idString => "#$id";

  @override
  DateTime get dateSolicitedInDateTime => DateTime.parse(dateSolicited!);

  @override
  DateTime get appointmentDateInDateTime => DateTime.parse(appointmentDate!);

  SchedulingData(
      {id,
        paciente,
        dataSolicitacao,
        dataContato,
        score,
        classificacao,
        dataSolicitada,
        dataConsulta,
        confirmacao});

  SchedulingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient = json['paciente'];
    solicitationDate = datePattern.format(DateTime.parse(json['dataSolicitacao']));
    contactDate = datePattern.format(DateTime.parse(json['dataContato']));
    score = json['score'];
    classification = json['classificacao'];
    dateSolicited = json['dataSolicitada'];
    appointmentDate = json['dataConsulta'];
    confirmation = json['confirmacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paciente'] = patient;
    data['dataSolicitacao'] = solicitationDate;
    data['dataContato'] = contactDate;
    data['score'] = score;
    data['classificacao'] = classification;
    data['dataSolicitada'] = dateSolicited;
    data['dataConsulta'] = appointmentDate;
    data['confirmacao'] = confirmation;
    return data;
  }

}
