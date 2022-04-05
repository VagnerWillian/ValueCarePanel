import 'package:value_panel/app/modules/patient_details/domain/entities/symptom_info.entity.dart';

class SymptomInfo implements SymptomInfoEntity{

  @override
  late final int id;

  @override
  late final String label;

  @override
  late final String description;

  @override
  late final String image;


  SymptomInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['descricao'];
    image = json['imagem'];
  }

}