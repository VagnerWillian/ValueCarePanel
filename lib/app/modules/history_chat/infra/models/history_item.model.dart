import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';

class HistoryItem implements HistoryItemEntity {
  @override
  late final String id;

  @override
  late final String operator;

  @override
  late final String text;

  @override
  late final String data;

  @override
  int? idNewClassification;

  @override
  String? newAppointmentDate;

  @override
  int? idNewSpecialty;

  @override
  bool? newStatusConfirmation;

  @override
  bool hasRead = true;

  HistoryItem.sendText({required this.operator, required this.text, required this.data, this.hasRead = true});
  HistoryItem.sendWarningSetter(
      {required this.operator,
      required this.idNewClassification,
      required this.newAppointmentDate,
      required this.idNewSpecialty,
      required this.newStatusConfirmation,
      required this.data,
      this.hasRead = true});

  HistoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operator = json['nome'] ?? "";
    text = json['texto'] ?? "";
    data = json['data'] ?? "";
    idNewClassification = json['idNovaClassificacao'];
    newAppointmentDate = json['dataNovoAgendamento'];
    idNewSpecialty = json['idNovaEspecialidade'];
    newStatusConfirmation = json['novoStatusConfirmacao'];
    hasRead = json['lido'] ?? true;
  }
}
