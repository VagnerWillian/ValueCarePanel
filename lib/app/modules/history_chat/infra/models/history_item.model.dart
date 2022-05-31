import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';

class HistoryItem implements HistoryItemEntity{

  @override
  late final int id;

  @override
  late final String name;

  @override
  late final String text;

  @override
  late final String data;

  @override
  bool hasRead = true;

  HistoryItem.send({required this.name, required this.text, required this.data});

  HistoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome']??"";
    text = json['texto']??"";
    data = json['data']??"";
    hasRead = json['lido']??true;
  }
}
