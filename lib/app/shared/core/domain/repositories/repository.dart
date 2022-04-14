import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';

abstract class CoreRepository{
  Future<List<ClassificationEntity>> getClassifications();
  Future<List<SpecialtyEntity>> getSpecialties();
}