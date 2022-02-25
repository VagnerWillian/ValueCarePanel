import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';

class Specialty implements SpecialtyEntity {

  @override
  late final int id;

  @override
  late final String label;

  @override
  late final String image;

  Specialty({this.id = 0, this.label = 'Nan', this.image = 'Nan'});

  Specialty.fromJson(Map<String, dynamic> json) {
    id = json['id']??"Nan";
    label = json['label']??"Nan";
    image = json['imagem']??"Nan";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['imagem'] = image;
    return data;
  }
}
