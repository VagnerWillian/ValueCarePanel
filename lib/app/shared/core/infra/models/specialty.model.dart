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
    label = json['nome']??"Nan";
    image = json['icone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = label;
    data['icone'] = image;
    return data;
  }
}
