import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';

class HistoryItem implements HistoryItemEntity{

  @override
  late final int id;

  @override
  late final bool isAnswer;

  @override
  late final String name;

  @override
  late final String photo;

  @override
  late final String text;

  HistoryItem({this.id=0, this.isAnswer=false, this.name='', this.photo='', this.text=''});

  HistoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    isAnswer = json['resposta']??false;
    name = json['nome']??"";
    photo = json['foto']??"";
    text = json['texto']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['resposta'] = isAnswer;
    data['nome'] = name;
    data['foto'] = photo;
    data['texto'] = text;
    return data;
  }
}
