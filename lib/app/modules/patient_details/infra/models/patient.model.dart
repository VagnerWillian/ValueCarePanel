import 'package:value_panel/app/modules/patient_details/domain/entities/additional_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/patient.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/sequel_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/infra/models/sequel_info.model.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';

import '../../../../shared/core/infra/models/classification.model.dart';
import 'additional_info.model.dart';

class Patient implements PatientEntity{

  @override
  late final String birthday;

  @override
  late final String cpf;

  @override
  late final String email;

  @override
  late final String gen;

  @override
  late final String name;

  @override
  late final String phone;

  @override
  late final String photo;

  @override
  late final ClassificationEntity classificationEntity;

  @override
  late final String origin;

  @override
  late final int score;

  @override
  late final List<AdditionalInfoEntity> additionalInfo;

  @override
  late final List<SequelInfoEntity> sequels;

  Patient.fromJson(Map<String, dynamic> json) {
    birthday = json['nascimento'];
    cpf = json['cpf'];
    email = json['email'];
    gen = json['genero'];
    name = json['nome'];
    phone = json['telefone'];
    photo = json['foto'];
    origin = json['origem'];
    score = json['score'];
    classificationEntity = Classification.fromJson(json['classificacao']);
    sequels = (json['sequelas'] as List).map((json) => SequelInfo.fromJson(json)).toList();
    additionalInfo = (json['adicional'] as List).map((json) => AdditionalInfo.fromJson(json)).toList();
  }


}