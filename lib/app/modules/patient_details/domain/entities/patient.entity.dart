import 'package:value_panel/app/modules/patient_details/domain/entities/additional_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/sequel_info.entity.dart';
import 'package:value_panel/app/modules/patient_details/domain/entities/symptom_info.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';

import '../../../../shared/core/infra/models/classification.model.dart';

abstract class PatientEntity{
  late final String name;
  late final String phone;
  late final String photo;
  late final String cpf;
  late final String birthday;
  late final String gen;
  late final String email;
  late final String origin;
  late final int score;
  late final Classification classification;
  List<SequelInfoEntity> sequels = [];
  List<AdditionalInfoEntity> additionalInfo = [];
  List<SymptomInfoEntity> symptoms = [];
}