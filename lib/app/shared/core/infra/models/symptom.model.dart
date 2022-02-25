import 'package:equatable/equatable.dart';
import 'package:value_panel/app/shared/core/domain/entities/symptoms.entity.dart';

class Symptom extends Equatable implements SymptomEntity {

  @override
  late final int id;

  @override
  late String dateReport;

  @override
  late final String label;

  @override
  late final String srcImage;

  @override
  late final String intensity;

  Symptom({required this.id, required this.label, this.srcImage = '', this.dateReport = '', this.intensity = ''});

  Symptom.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    label = json['label']??"Nan";
    dateReport = json['reportado_em']??"Nan";
    srcImage = json['imagem']??"Nan";
    intensity = json['intensidade']??"Nan";
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['label'] = label;
    data['reportado_em'] = dateReport;
    data['imagem'] = srcImage;
    data['intensidade'] = intensity;
    return data;
  }

  @override
  List<Object?> get props => [id];

}
